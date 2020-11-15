class ChangeProductIdToUuid < ActiveRecord::Migration[6.0]
  def change
    add_column :prices, :uuid, :uuid, null: false
    change_table :prices do |t|
      t.remove :product_id
      t.rename :uuid, :product_id
    end
    # add_reference :prices, :product, foreign_key: true
  end
end
