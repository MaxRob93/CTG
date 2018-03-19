class Meal < ApplicationRecord
  belongs_to :meal_provider
  has_many :meal_orders
end
