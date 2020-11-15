class ChangeBrandCatePlural < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :brands
    remove_reference :products, :categories
    add_reference :products, :brand, foreign_key: true
    add_reference :products, :category, foreign_key: true
  end
end
