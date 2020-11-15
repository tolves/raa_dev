class ProductsController < ApplicationController
  skip_before_action :authorized
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

end
