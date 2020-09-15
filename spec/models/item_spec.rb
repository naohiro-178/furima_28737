require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'image, name, explanation, category_id, bland_id, shipping_id, shipping_area_id, shipping_date_id, priceがあれば出品できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'explanatinが空では出品できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idが1では出品できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category condition Selected')
    end

    it 'bland_idが1では出品できないこと' do
      @item.bland_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Bland condition Selected')
    end

    it 'shipping_idが1では出品できないこと' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee Selected')
    end

    it 'shipping_area_idが1では出品できないこと' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area Selected')
    end

    it 'shipping_date_idが1では出品できないこと' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date Selected')
    end

    it 'priceが空では出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円以下では出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が9999999円以上では出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '価格は半角数字で入力しないと出品できないこと' do
      @item.price = '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
