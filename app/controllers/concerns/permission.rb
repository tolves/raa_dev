module Permission
  extend ActiveSupport::Concern

  included do
    before_action :check_permission
  end

  def permissions
    {
      'products' => {
        :user => [:index, :show],
      },
      'users' => {
        :user => [:show, :update, :edit]
      },
      'admin' => {
      },
      'admin/products' => {
      },
      'admin/brands' => {
      },
      'admin/categories' => {
      },
      'admin/prices' => {
      }
    }
  end


  def check_permission
    return true if current_user.is_admin?
    controller_permissions = permissions[controller_path]
    role = current_user.role

    if controller_permissions.keys.include?(role)
      if !controller_permissions[role].include?(action_name.to_sym)
        flash.alert = 'You do not have enough permission'
        return redirect_to :permission_restriction
      end
      
      if controller_name == 'users' && current_user != User.find(params[:id])
        flash.alert = 'You do not have enough permission'
        return redirect_to :permission_restriction
      end
    else
      flash.alert = 'You do not have enough permission'
      return redirect_to :permission_restriction
      # head 403
    end
  end
end