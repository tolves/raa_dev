class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @price = @product.price.build
  end

  def create
    @product = Product.new(product_params)
    @price = @product.price.create(:price=>10)
    puts @product.inspect
    puts @price.inspect
    # if @product.save
      # flash.notice = 'Add Product successful'
      # redirect_to :admin_products
    # else
      # flash.notice = @product.errors
      # redirect_to :new_admin_product
    # end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash.notice = 'Change Product Details Successful'
      redirect_to :admin_products
    else
      flash.notice = @product.errors.messages
      redirect_to = :edit_admin_product
    end
  end

  def show
  end

  private
  def product_params
    params.require(:product).permit(:name, :brand_id, :category_id, :types, :detail)
  end

  def price_params
    params.require(:product).permit(:price)
  end
end
