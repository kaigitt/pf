class PlayList < ApplicationRecord

  belongs_to :user
  has_many :play_list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :user_favorited, through: :favorites
  has_many :play_list_songs, dependent: :destroy
  has_many :songs, through: :play_list_songs
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  accepts_nested_attributes_for :songs, :play_list_songs

  attachment :play_list_image

  with_options presence: true do
    validates :title
    validates :body
  end

  def self.search_pl(search)
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
