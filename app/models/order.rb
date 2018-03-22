class Order < ApplicationRecord
  has_many :meal_orders
  has_many :meals, through: :meal_orders
  belongs_to :user
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  monetize :amount_cents
end
