class AddProductDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :detail, :string
  end
end
