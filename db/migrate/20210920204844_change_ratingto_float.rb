class ChangeRatingtoFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :rating, :float
  end
end
