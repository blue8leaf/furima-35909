class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefectures_id, :municipalities, :house_number, :building_name,
                :telephone_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities,
                   house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
