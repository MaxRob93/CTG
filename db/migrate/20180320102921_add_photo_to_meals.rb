class AddPhotoToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :photo, :string
  end
end
