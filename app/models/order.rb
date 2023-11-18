class Order
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address,:building,:phone_number,:bought_record_id,:user_id,:item_id,:token

  with_options presence: true do
    validates :token
    validates :postal_code,    format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid.Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/,
        message: ->(object, data) {
        if data[:value] =~ /\D/
          "is invalid. Input only number"
        elsif data[:value].length < 10
          "is too short"
        elsif data[:value].length > 11
          "is too long"
        end
      }
    }
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id,  numericality: { other_than: 1,message: "can't be blank" }

  def save
    bought_record = BoughtRecord.create(user_id: user_id,item_id: item_id)

    ShippingAddress.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,address: address,building: building,phone_number: phone_number,bought_record_id: bought_record.id)
  end
end