class ChangeProductPrimaryKey < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE products ADD PRIMARY KEY (id);"
  end
end
