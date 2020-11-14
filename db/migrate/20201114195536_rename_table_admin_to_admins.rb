class RenameTableAdminToAdmins < ActiveRecord::Migration[6.0]
  def change
    rename_table :admin, :admins
  end
end
