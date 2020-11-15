class Admin::ProductsController < ApplicationController
  before_action :admin_authorized
  before_action :brands, :categories, only: [:new, :edit]
  skip_before_action :authorized

  def index
    @products = Product.all
    @a = Product.last
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash.notice = 'Add Product successful'
      redirect_to :admin_products
    else
      flash.notice = @product.errors
      redirect_to :new_admin_product
    end
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
    params.require(:product).permit(:name, :price, :brand_id, :category_id, :types, :detail)
  end

  def brands
    @brands = Brand.all
  end

  def categories
    @categories = Category.all
  end
end
