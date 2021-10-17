class AddSalesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sales, :integer
  end
end
