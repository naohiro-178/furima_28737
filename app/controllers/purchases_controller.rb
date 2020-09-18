class PurchasesController < ApplicationController

  def index
    @items = Item.find(params[:item_id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:item_id, :user_id)
  end

end
