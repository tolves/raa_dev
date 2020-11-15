class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end
    remove_column :products, :categories, :string
    add_reference :products, :categories
  end
end
