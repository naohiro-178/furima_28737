class PurchasesController < ApplicationController
  before_action :move_to_sign_in, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index]
  def index
    @items = Item.find(params[:item_id])
    @purchase = Purchase.find(params[:item_id])
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

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase != nil
      redirect_to root_path
    end
  end

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
