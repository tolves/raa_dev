class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @prices = @product.prices.build
  end

  def create
    @product = Product.new(product_params)
    @price = @product.prices.build(
        seller: price_params[:price][:seller],
        link: price_params[:price][:link],
        price: {Time.now => price_params[:price][:price]}
    )
    
    if @product.save && @price.save
      flash.notice = 'Add Product successful'
      redirect_to :admin_products
    else
      flash.notice = @product.errors.messages.to_s + @price.errors.messages.to_s
      redirect_to :new_admin_product
    end
  end

  def edit
    @product = Product.find(params[:id])
    @prices = @product.prices.build
  end

  def update
    @product = Product.find(params[:id])
    @price = @product.prices.build(
        seller: price_params[:price][:seller],
        link: price_params[:price][:link],
        price: {Time.now => price_params[:price][:price]}
    )
    if @product.update(product_params) && @price.save
      flash.notice = 'Change Product Details Successful'
      redirect_to :admin_products
    else
      flash.notice = @product.errors.messages
      redirect_to = :edit_admin_product
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :brand_id, :category_id, :types, :detail)
  end

  def price_params
    params.require(:product).permit(price: %i[price seller link])
  end
end
