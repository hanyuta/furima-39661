class Item < ApplicationRecord
  has_one_attached :item_image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  validates :prefecture_id,                       numericality: {other_than: 1, message: "can't be blank"}
  validates :item_category_id,                    numericality: {other_than: 1, message: "can't be blank"}
  validates :item_sales_status_id,                numericality: {other_than: 1, message: "can't be blank"}
  validates :item_shipping_fee_status_id,         numericality: {other_than: 1, message: "can't be blank"}
  validates :item_scheduled_delivery_id,          numericality: {other_than: 1, message: "can't be blank"}
  validates :item_name,:item_info,:item_price,    presence:true

end
