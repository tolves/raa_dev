module Authorisation
  extend ActiveSupport::Concern
  included do
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
  end

  def current_user
    User.find_by(id: session[:user_id]) || Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    if logged_in?
      return true if current_user.is_admin?
      return redirect_to :permission_restriction if !current_user.is_admin? && (controller_path.match(/^admin/))
    else
      flash.notice = 'Login Please'
      return redirect_to :admin_login if controller_path.match(/^admin/)
      return redirect_to :login
    end
  end
end