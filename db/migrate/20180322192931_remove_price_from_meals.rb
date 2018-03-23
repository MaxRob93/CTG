class RemovePriceFromMeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :meals, :price, :float
  end
end
