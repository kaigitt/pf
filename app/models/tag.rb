class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy
end
