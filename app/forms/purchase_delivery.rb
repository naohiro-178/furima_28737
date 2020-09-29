class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :shipping_area_id, :municipalities, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は7文字以内で入力してください' }
    validates :shipping_area_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は11文字以内で入力してください' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
