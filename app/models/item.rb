class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :bland_id, numericality: { other_than: 1, message: 'condition Selected' }
    validates :shipping_id, numericality: { other_than: 1, message: 'shipping fee Selected' }
    validates :shipping_area, numericality: { other_than: 1, message: 'shipping area Select' }
    validates :shipping_date, numericality: { other_than: 1, message: 'shipping date Select' }
    validates :price
  end
end
