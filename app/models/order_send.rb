class OrderSend
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id
end