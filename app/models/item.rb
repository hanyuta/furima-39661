class Item < ApplicationRecord
  has_one_attached :item_image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  validates :item_image, presence: true
  validates :item_name, :item_info, presence: true
  validates :item_category_id,                    numericality: { other_than: 1, message: "can't be blank" }
  validates :item_sales_status_id,                numericality: { other_than: 1, message: "can't be blank" }
  validates :item_shipping_fee_staus_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,                       numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price,                          presence: true,
                                                  format: { with: /\A[3-9][0-9]{2,6}\z/, message: 'is only numbers' }
end
