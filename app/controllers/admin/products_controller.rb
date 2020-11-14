class Admin::ProductsController < ApplicationController
  before_action :admin_authorized
  skip_before_action :authorized

  def index
  end
end
