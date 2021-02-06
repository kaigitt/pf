class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :play_lists, through: :tag_maps
end
