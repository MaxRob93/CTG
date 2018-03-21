class MealProvider < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  mount_uploader :photo, PhotoUploader
end
