class Meal < ApplicationRecord
  belongs_to :meal_provider
  has_many :meal_orders
  validates :name, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
  validates :sku, presence: true
  monetize :price_cents
end
