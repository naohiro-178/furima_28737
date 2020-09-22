class PurchasesController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
  end

  def new
    @purchase = PurchaseDelivery.new
  end

  def create
    @items = Item.find(params[:item_id])
    @purchase = PurchaseDelivery.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :shipping_area_id, :municipalities, :address, :building, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
