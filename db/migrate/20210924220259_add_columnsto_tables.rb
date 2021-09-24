class AddColumnstoTables < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :billing_address, :string
    add_column :users, :name, :string
    add_column :users, :shipping_address, :string
  end
end
