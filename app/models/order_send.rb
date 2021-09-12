class OrderSend
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :municipalities, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}
  end
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Send.create(postal_code: postal_code, prefecture_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end