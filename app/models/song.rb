class Song < ApplicationRecord

  has_many :play_list_songs,dependent: :destroy
  has_many :play_list, through: :play_list_songs
end
