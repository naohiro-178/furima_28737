class Delivery < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Full with 7'}
    validates :shipping_area_id, numericality: { other_than: 1, message: 'Selected' }
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'Full with 11' }
    validates :purchased_id
  end
end
