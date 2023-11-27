class Furima < ApplicationRecord
  belongs_to :user
  has_one_attachsd :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
end
