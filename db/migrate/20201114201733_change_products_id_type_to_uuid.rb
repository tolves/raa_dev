class ChangeProductsIdTypeToUuid < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
    add_column :products, :uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :products do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE products ADD PRIMARY KEY (id);"
  end
end
