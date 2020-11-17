class Admin::PricesController < ApplicationController
  before_action :product
  before_action :price, on: %i[edit, update, destroy]

  def index;
  end

  def new
    @price = @product.prices.build
  end

  def create
    @price = @product.prices.build price_params
    flash.notice, path = if @price.save
                           ['Add Seller Successful', admin_product_path(@product)]
                         else
                           [@price.errors.messages, new_admin_product_price_path(@product)]
                         end
    redirect_to path
  end

  def edit;
  end

  def update
    flash.notice, path = if @price.update(price_params)
                           ['Add New Price Successful', admin_product_path(@product)]
                         else
                           [@price.errors.messages, edit_admin_product_price_path(@product, @price)]
                         end
    redirect_to path
  end

  def destroy
    flash.notice = if @price.destroy
                     'Delete price successful'
                   else
                     'Delete price failed'
                   end
    redirect_to admin_product_path(@product)
  end

  private

  def product
    @product = Product.find params[:product_id]
  end

  def price
    @price = @product.prices.find params[:id]
  end

  def product_params
    params.permit(:product_id)
  end

  def price_params
    params.require(:price).permit(%i[price seller link])
  end

end
