class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :token, :shipping_area_id, :building, :user_id, :item_id, :postal_code, :shipping_area_id, :municipalities, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Full with 7' }
    validates :shipping_area_id, numericality: { other_than: 1, message: 'Selected' }
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Full with 11' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(shipping_area_id: shipping_area_id, building: building, postal_code: postal_code, municipalities: municipalities, address: address, phone_number: phone_number)
  end
end
