class Song < ApplicationRecord

  has_many :play_list_songs,dependent: :destroy
  has_many :play_list, through: :play_list_songs

  def self.search_song_lists(search)
    return Song.all unless search
    Song.where([' name LIKE ? OR artist_name LIKE ?', "%#{search}%","%#{search}%"])
  end
end
