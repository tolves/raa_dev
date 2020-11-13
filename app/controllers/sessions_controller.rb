class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :sign_out]
  def welcome
  end

  def new
  end

  def create
    @user = User.find_by_name params[:username]
    if @user && @user.authenticate(@user, params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash.notice = 'Incorrect password'
      redirect_to :login
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to :root
  end

  private
  def login_params
  end
end