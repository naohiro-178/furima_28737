class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :bland_id, :shipping_id, :shipping_area, :shipping_date, :price).merge(user_id: current_user.id)
  end
end
