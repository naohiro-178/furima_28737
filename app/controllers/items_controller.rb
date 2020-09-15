class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :bland_id, :shipping_id, :shipping_area, :shipping_date, :price).merge(user_id: current_user.id)
  end
end
