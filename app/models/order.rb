class Order
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address,:building,:phone_number,:bought_record_id,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal_code,    format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid.Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id,  numericality: { other_than: 1,message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,   numericality: {only_integer: true, greater_than_or_equal_to:9_999_999_999}
    validates :user_id
    validates :item_id
    validates :bought_record_id
  end
end