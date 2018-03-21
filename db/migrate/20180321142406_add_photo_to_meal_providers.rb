class AddPhotoToMealProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :meal_providers, :photo, :string
  end
end
