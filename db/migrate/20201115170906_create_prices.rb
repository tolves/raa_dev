class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.belongs_to :product
      t.string :seller
      t.string :link
      t.json :price
      t.integer :best_price
      t.timestamps
    end
  end
end
