class Order
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address,:building,:phone_number,:bought_record_id,:user_id,:item_id,:token


end