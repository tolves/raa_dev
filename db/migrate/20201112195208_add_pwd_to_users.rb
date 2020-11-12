class AddPwdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :salt, :string, :limit => 32
    add_column :users, :password, :string, :limit => 32
  end
end
