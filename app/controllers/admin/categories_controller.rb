class Admin::CategoriesController < ApplicationController
  before_action :admin_authorized
  skip_before_action :authorized
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash.notice = 'Add category successful'
      redirect_to :admin_products
    else
      flash.notice = @category.errors
      redirect_to :new_admin_category
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
