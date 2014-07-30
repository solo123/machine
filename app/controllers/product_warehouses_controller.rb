class ProductWarehousesController < ApplicationController
  def index
  end

  def show
    @object = ProductsWarehouses.find(params[:id])
  end
end

