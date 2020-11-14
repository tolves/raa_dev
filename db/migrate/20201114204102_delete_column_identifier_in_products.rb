class DeleteColumnIdentifierInProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :identifier, :uuid
  end
end
