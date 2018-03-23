class Order < ApplicationRecord
  has_many :meal_orders
  has_many :meals, through: :meal_orders
  belongs_to :user
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  monetize :amount_cents


  def total
    meals.sum(:price_cents)
  end

  def total_pretty
    total / 100
  end




end
