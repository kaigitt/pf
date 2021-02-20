class Song < ApplicationRecord

  has_many :play_list_songs,dependent: :destroy
  has_many :play_lists, through: :play_list_songs

  validates :play_lists, associated: true

  with_options presence: true do
    validates :name
    validates :artist_name
  end

  def self.search_song_lists(search)
    return Song.all unless search
    Song.where([' name LIKE ? OR artist_name LIKE ?', "%#{search}%","%#{search}%"])
  end
end
