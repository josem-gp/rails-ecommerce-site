class AddAvailabilityToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :availability, :integer
  end
end
