class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_admin
  helper_method :logged_in?
  helper_method :is_admin?
  before_action :authorized

  def current_user    
    User.find_by(id: session[:user_id])  
  end
  def logged_in?
    !current_user.nil?  
  end
  def authorized
    redirect_to :root unless logged_in?
  end

  def current_admin
    Admin.find_by(id: session[:admin_id])
  end
  def is_admin?
    !current_admin.nil?
  end
  def admin_authorized
    redirect_to :admin_login unless is_admin?
  end

end
