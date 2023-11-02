class Item < ApplicationRecord
  has_one_attached :item_image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :presence

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
end
