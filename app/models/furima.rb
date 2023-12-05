class Furima < ApplicationRecord
  belongs_to :user
  has_one :log
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates_format_of :price, with: /\A[0-9]+\z/
  validates :name, length: { maximum: 40 }
  validates :info, length: { maximum: 1000 }

  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }

  def sold_out?
    Log.exists?(furima_id: id)
  end
  

end
