class TagMap < ApplicationRecord

  belongs_to :tag
  belongs_to :play_list

  validates :play_list_id, presence: true
  validates :tag_id, presence: true
end
