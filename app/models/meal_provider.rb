class MealProvider < ApplicationRecord
  belongs_to :user
  has_many :meals
end