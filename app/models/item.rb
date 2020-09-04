class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :bland
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :bland_id, numericality: { other_than: 1 }
    validates :shipping_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_date, numericality: { other_than: 1 }
    validates :price
  end
end
