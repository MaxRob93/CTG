class MealOrder < ApplicationRecord
  belongs_to :order
  belongs_to :meal
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
