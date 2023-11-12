class ShippingAddress < ApplicationRecord
  belongs_to :bought_record

  validates :postal_code,    presence: true ,format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid.Enter it as follows (e.g. 123-4567)"}
  validates :prefecture_id,  presence: true
  validates :city,           presence: true
  validates :address,        presence: true
  validates :phone_number,   presence: true ,numericality: {only_integer: true, greater_than_or_equal_to:9_999_999_999}


end