class RemoveSubtotalFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :subtotal, :integer
  end
end
