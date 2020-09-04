class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id 
    validates :condition
    validates :shipping_fee
    validates :shipping_area
    validates :shipping_date
    validates :price
  end
end
