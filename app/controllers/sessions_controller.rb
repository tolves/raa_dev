class SessionsController < ApplicationController
  skip_before_action :authorized
  skip_before_action :check_permission

  def login;
  end

  def create
    @user = User.find_by_name params[:name]
    flash.notice, path = if @user&.authenticate(params[:password])
                           session[:user_id] = @user.id
                           ['Login Successful', :root]
                         else
                           ['Incorrect Password', :login]
                         end
    redirect_to path
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

  def permission_restriction;
  end

  private

  def login_params;
  end
end
