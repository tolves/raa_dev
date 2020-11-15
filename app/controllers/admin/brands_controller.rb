class Admin::BrandsController < ApplicationController
  before_action :admin_authorized
  skip_before_action :authorized
  def new
    @brand = Brand.new
  end
  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash.notice = 'Add Brand successful'
      redirect_to :admin_products
    else
      flash.notice = @brand.errors
      redirect_to :new_admin_brand
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:name)
  end
end
