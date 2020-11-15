class AddforeignkeyFromPricesToProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :prices, :product_id
    add_reference :prices, :product, foreign_key: true
  end
end
