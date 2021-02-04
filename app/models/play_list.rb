class PlayList < ApplicationRecord

  has_many :play_list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :play_list_songs, dependent: :destroy
  has_many :songs, through: :play_list_songs

  accepts_nested_attributes_for :play_list_songs, allow_destroy: true
  attachment :play_list_image

  with_options presence: true do
    validates :title
    validates :body
  end
end
