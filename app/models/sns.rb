class Sns < ApplicationRecord
  belongs_to :user, optional: true
end
