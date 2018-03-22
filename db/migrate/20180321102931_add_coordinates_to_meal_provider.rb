class AddCoordinatesToMealProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :meal_providers, :latitude, :float
    add_column :meal_providers, :longitude, :float
  end
end
