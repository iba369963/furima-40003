class Furima < ApplicationRecord
  belongs_to :user
  has_one_attachsd :image
end
