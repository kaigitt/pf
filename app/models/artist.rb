class Artist < ApplicationRecord

  has_many :play_list_songs, dependent: :destroy
end
