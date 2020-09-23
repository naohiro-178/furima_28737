require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入者情報の保存' do
    before do
      @purchase_delivery = FactoryBot.build(:purchase_delivery)
    end

    it 'user_idがないと購入できないこと' do
      @purchase_delivery.user_id = nil
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idがないと購入できないこと' do
      @purchase_delivery.item_id = nil
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
    end

    it 'カード情報が空欄だと購入できないこと' do
      @purchase_delivery.token = nil
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号はハイフンを含めた7文字以内であること' do
      @purchase_delivery.postal_code = nil
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include('Postal code Full with 7')
    end

    it 'shipping_area_idが1では購入できないこと' do
      @purchase_delivery.shipping_area_id = 1
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include('Shipping area Selected')
    end

    it '市区町村が空欄だと購入できないこと' do
      @purchase_delivery.municipalities = nil
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include("Municipalities can't be blank")
    end

    it '番地が空欄だと購入できないこと' do
      @purchase_delivery.address = nil
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
    end
    
    it '電話番号はハイフンを抜いた11文字以内であること' do
      @purchase_delivery.phone_number = '080-1111-2222'
      @purchase_delivery.valid?
      expect(@purchase_delivery.errors.full_messages).to include('Phone number Full with 11')
    end
  end

end 