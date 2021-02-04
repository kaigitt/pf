class PlayListSong < ApplicationRecord

  belongs_to :play_list
  belongs_to :song

  with_options presence: true do
    validates :name
    validates :description
  end
end
