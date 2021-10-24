class AddCheckedToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :checked, :integer
    add_column :orders, :checked, :integer
  end
end
