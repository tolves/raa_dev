class ChangeProductsPricesToId < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :ppid, :integer
    add_column :products, :uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :products do |t|
      t.remove :id
      t.rename :ppid, :id
    end
    # execute "ALTER TABLE products ADD PRIMARY KEY (id);"

    add_column :prices, :ppid, :integer
    change_table :prices do |t|
      t.remove :product_id
      t.rename :ppid, :product_id
    end

  end
end
