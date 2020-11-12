class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def welcome
  end

  def new
  end

  def create
    @user = User.find_by_name params[:username]
    if @user && @user.authenticate(@user, params[:password])
      session[:user_id] = @user.id
      redirect_to :index_path
    else
      flash.notice = 'Incorrect password'
      redirect_to '/login'
    end
  end
  def page_requires_login
  end

  private
  def login_params
  end
end
