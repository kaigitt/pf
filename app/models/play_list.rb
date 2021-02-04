class PlayList < ApplicationRecord
  
  has_many :play_list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :play_list_songs, dependent: :destroy
end
