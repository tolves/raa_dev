class AdminsController < ApplicationController
  skip_before_action :authorized
  before_action :admin_authorized, except: [:login, :login_auth, :sign_out,]
  def index
  end

  def login
  end

  def login_auth
    @admin = Admin.find_by_name params[:name]
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to :admins
    else
      flash.notice = 'Incorrect password'
      redirect_to :admin_login
    end
  end

  def sign_out
    session[:admin_id] = nil
    redirect_to :root
  end

  private
  def login_params
  end
end
