class PlayList < ApplicationRecord

  belongs_to :user
  has_many :play_list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :user_favorited, through: :favorites
  has_many :play_list_songs, dependent: :destroy
  has_many :songs, through: :play_list_songs
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :notifications, dependent: :destroy

  accepts_nested_attributes_for :songs, :play_list_songs

  attachment :play_list_image

  validates :songs, associated: true

  with_options presence: true do
    validates :title
    validates :body
  end

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      play_list_id: id,
      visited_id: user_id,
      action: "like"
      )
      notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人を全て取得
    temp_ids = Comment.select(:user_id).where(play_list_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each { |temp_id| save_notification_comment!(current_user, comment_id, temp_id['user_id']) }
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      play_list_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
      )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  # 検索用メソッド
  def self.search_song_lists(search)
    return PlayList.all unless search
    songs = Song.where([' name LIKE ?',"%#{search}%"])
    songs.each { |song|
      @play_lists = []
      @play_lists << song.play_list.id
    }
  end

  def self.search_tag_lists(search)
    return PlayList.all unless search
    songs = Song.where([' name LIKE ?',"%#{search}%"])
    songs.each { |song|
      play_lists = []
      play_lists << songs.play_lists.id
    }
    play_lists
  end

  def self.search_play_lists(search)
    return PlayList.all unless search
    PlayList.where(['title LIKE ? OR body LIKE ?', "%#{search}%","%#{search}%"])
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(name: new)
      self.tags << new_tag
    end
  end
end
