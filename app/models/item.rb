class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :item_name,         presence: true, length: { maximum: 40 }
  validates :explanation,       presence: true, length: { maximum: 1000 }
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :delivery_price_id, presence: true
  validates :prefectures_id,    presence: true
  validates :send_day_id,       presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_price
  belongs_to :prefectures
  belongs_to :send_day

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_price_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :send_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
