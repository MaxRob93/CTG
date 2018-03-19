class CreateMealProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_providers do |t|
      t.string :name
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
