class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name,         presence: true
  validates :explanation,       presence: true
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :delivery_price_id, presence: true
  validates :prefectures_id,    presence: true
  validates :send_day_id,       presence: true
  validates :price,             presence: true
  validates :image,             presence: true
end
