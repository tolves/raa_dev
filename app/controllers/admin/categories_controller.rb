class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    flash.notice, path = if @category.save
                           ['Add category successful', :admin_products]
                         else
                           [@category.errors, :new_admin_category]
                         end
    redirect_to path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
