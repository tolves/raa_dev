class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :limit => 32, :null => false
      t.integer :favourites, array: true

      t.timestamps
    end
  end
end
