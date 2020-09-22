require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入者情報の保存' do
    before do
      @purchase_delivery = FactoryBot.build(:purchase_delivery)
    end
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_delivery).to be_valid
    end

    it 'カード情報が空欄だと購入できないこと' do
    end

    it '郵便番号はハイフンを含めた7文字以内であること' do
    end

    it 'shipping_idが1では購入できないこと' do
      @purchase.shipping_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Shipping  Selected')
    end

    it '市区町村が空欄だと購入できないこと' do
    end

    it '番地が空欄だと購入できないこと' do
    end
    
    it '電話番号はハイフンを抜いた11文字いないであること' do
    end

end
