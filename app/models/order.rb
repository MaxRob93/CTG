class Order < ApplicationRecord
  has_many :meal_orders
end
