class MealProvider < ApplicationRecord
  belongs_to :user
  has_many :meals
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
end
