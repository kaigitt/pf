class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :play_list
end
