class Admin::BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    flash.notice, path = if @brand.save
                           ['Add Brand successful', :admin_products]
                         else
                           [@brand.errors, :new_admin_brand]
                         end
    redirect_to path
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
