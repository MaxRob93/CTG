class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.float :price
      t.references :meal_provider, foreign_key: true

      t.timestamps
    end
  end
end
