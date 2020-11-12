class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.uuid :identifier
      t.string :name
      t.string :brand
      t.string :categories
      t.string :types
      t.json :price
      t.timestamps
    end
  end
end
