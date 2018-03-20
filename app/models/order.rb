class Order < ApplicationRecord
  has_many :meal_orders
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
