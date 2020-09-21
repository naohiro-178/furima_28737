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
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:shipping_area_id, :building, :item_id, :token, :postal_code, :shipping_area, :municipalities, :address, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_820c2179e3d3603456a6024a"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end

end
