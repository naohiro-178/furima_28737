class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create
  end

end
