class Admin::PricesController < ApplicationController
  before_action :product

  def index;
  end

  def new
    @price = @product.prices.build
  end

  def create
    @price = @product.prices.build price_params
    if @price.save
      flash.notice = 'Add Seller Successful'
      redirect_to admin_product_prices_path @product
    else
      flash.notice = @price.errors.messages
      redirect_to new_admin_product_price_path @product
    end
  end

  def edit;
  end

  private

  def product
    @product = Product.find params[:product_id]
  end

  def product_params
    params.permit(:product_id)
  end

  def price_params
    params.require(:price).permit(%i[price seller link])
  end

end
