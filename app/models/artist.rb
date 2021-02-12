class Artist < ApplicationRecord

  has_many :play_list_songs, dependent: :destroy

#   def self.search_artist(search)
#     return Artist.all unless search
#     # Artist.where([' LIKE ? OR  LIKE ?', "%#{search}%","%#{search}%"])
#     # カラム名追加
#     Artist.all
#   end
end
