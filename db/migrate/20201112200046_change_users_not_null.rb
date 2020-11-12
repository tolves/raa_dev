class ChangeUsersNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :password, false
    remove_column :users, :salt
    add_column  :users, :salts, :string, :limit => 32
    change_column_null :users, :salts, false
  end
end
