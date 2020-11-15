class SessionsController < ApplicationController
  skip_before_action :authorized
  def welcome
  end

  def new
  end

  def create
    @user = User.find_by_name params[:name]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash.notice = 'Incorrect Password'
      redirect_to :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

  private
  def login_params
  end
end
