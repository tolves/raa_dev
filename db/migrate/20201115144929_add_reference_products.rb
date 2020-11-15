class AddReferenceProducts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :brands
    remove_reference :products, :categories
    add_reference :products, :brands, foreign_key: true
    add_reference :products, :categories, foreign_key: true
  end
end
