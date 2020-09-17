class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase = Delivery.new
  end

  def create
    @purchase = Delivery.create(purchase_params)
  end

  private

  def purchase_params
    params.require(:delivery).permit(:postal_code, :prefecture, :municipalities, :address, :phone_number, :purchased_id)
  end
end
