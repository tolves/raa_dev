class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all.order(updated_at: :desc)
  end

  def new
    @product = Product.new
    @prices = @product.prices.build
  end

  def create
    @product = Product.new(product_params)
    @price = @product.prices.build(price_params)
    flash.notice, path = if @product.save
                           ['Add Product Successful', :admin_products]
                         else
                           [@product.errors.messages.to_s + @price.errors.messages.to_s, :new_admin_product]
                         end
    redirect_to path
  end

  def edit
    @product = Product.find(params[:id])
    @prices = @product.prices.build
  end

  def update
    @product = Product.find(params[:id])
    flash.notice, path = if @product.update(product_params)
                           ['Change Product Details Successful', :admin_products]
                         else
                           [@product.errors.messages, :edit_admin_product]
                         end
    redirect_to path
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    flash.notice, path = if @product.destroy
                           ['Delete product successful', :admin_products]
                         else
                           [@product.errors.messages, admin_product_path(@product)]
                         end
    redirect_to path
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand_id, :category_id, :types, :detail)
  end

  def origin_price_params
    params.require(:product).permit(price: %i[price seller link])
  end

  def price_params
    {
        seller: origin_price_params[:price][:seller],
        link: origin_price_params[:price][:link],
        price: origin_price_params[:price][:price]
    }
  end
end
