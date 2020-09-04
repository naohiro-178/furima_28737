class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :bland

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :bland_id, numericality: { other_than: 1 }
    validates :condition
    validates :shipping_fee
    validates :shipping_area
    validates :shipping_date
    validates :price
  end
end
