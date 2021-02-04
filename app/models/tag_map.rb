class TagMap < ApplicationRecord
  
  belongs_to :tag
  belongs_to :play_list
end
