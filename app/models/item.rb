class Item < ApplicationRecord
  has_one_attached :item_image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :suchedule
  belongs_to :user

  validates :item_image, presence: true
  validates :item_name, :item_info, presence: true
  validates :item_category_id,                    numericality: { other_than: 1, message: "can't be blank" }
  validates :item_sales_status_id,                numericality: { other_than: 1, message: "can't be blank" }
  validates :item_shipping_fee_staus_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,                       numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price,                          presence: true,numericality: { only_integer:true, greater_than_or_equal_to:300,less_than_or_equal_to:9999999 }
end
