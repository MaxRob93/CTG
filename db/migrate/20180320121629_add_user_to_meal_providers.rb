class AddUserToMealProviders < ActiveRecord::Migration[5.1]
  def change
    add_reference :meal_providers, :user, index: true
  end
end
