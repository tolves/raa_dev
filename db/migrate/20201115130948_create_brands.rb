class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.timestamps
    end
    remove_column :products, :brand, :string
    add_reference :products, :brands
  end
end
