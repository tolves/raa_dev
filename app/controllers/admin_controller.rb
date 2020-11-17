class AdminController < ApplicationController
  skip_before_action :authorized, except: :index
  skip_before_action :check_permission, except: :index

  def index;
  end

  def login;
  end

  def login_auth
    @admin = Admin.find_by_name params[:name]
    flash.notice, path = if @admin&.authenticate(params[:password])
                           session[:admin_id] = @admin.id
                           session[:user_id] = nil
                           ['Login Successful', :admin]
                         else
                           ['Incorrect Password', :admin_login]
                         end
    redirect_to path
  end

  def logout
    session[:admin_id] = nil
    redirect_to :root
  end

  private

  def login_params;
  end
end
