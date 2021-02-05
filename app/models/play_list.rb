class PlayList < ApplicationRecord

  belongs_to :user
  has_many :play_list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :play_list_songs, dependent: :destroy
  has_many :songs, through: :play_list_songs
  accepts_nested_attributes_for :songs, allow_destroy: true
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  accepts_nested_attributes_for :play_list_songs, allow_destroy: true
  attachment :play_list_image

  with_options presence: true do
    validates :title
    validates :body
  end

  def save_song(sent_songs)
    sent_songs.each do |song|
      song.save
    end
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


def create
  @article = current_user.articles.new(article_params)
  if @article.categories.include?(params[:categorie])
    すでにカテゴリーがあるとき
    @categories.
  else
    新規でつくる場合
  end
end