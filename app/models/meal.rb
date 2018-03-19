class Meal < ApplicationRecord
  belongs_to :meal_provider
  has_many :meal_orders
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
