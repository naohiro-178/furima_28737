class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :bland
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: 'condition Selected' }
    validates :bland_id, numericality: { other_than: 1, message: 'condition Selected' }
    validates :shipping_id, numericality: { other_than: 1, message: 'fee Selected' }
    validates :shipping_area_id, numericality: { other_than: 1, message: 'Selected' }
    validates :shipping_date_id, numericality: { other_than: 1, message: 'Selected' }
    validates :price, numericality: { greater_than_or_equal_to: 300 }
    validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Full-width hankaku characters' }
  end
end
