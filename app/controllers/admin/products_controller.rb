class Admin::ProductsController < ApplicationController
  before_action :admin_authorized
  skip_before_action :authorized

  def index
    @products = Product.all
    @a = Product.last
  end

  def new
    @product = Product.new
    @brands = Brand.all
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    puts @product.inspect
    if @product.save
      flash.notice = 'Add Product successful'
      redirect_to :admin_products
    else
      flash.notice = @product.errors
      redirect_to :new_admin_product
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :brand_id, :category_id, :types, :detail)
  end
end
