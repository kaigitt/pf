class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :play_list

  validates_uniqueness_of :play_list_id, scopee: :user_id
end
