class AddAdminTable < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :name, unique: true, null: false
      t.string :password, :limit => 32, null: false
      t.string :salts, :limit => 32, null: false
      t.timestamps
    end
  end
end