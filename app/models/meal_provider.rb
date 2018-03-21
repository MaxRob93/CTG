class MealProvider < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
<<<<<<< HEAD

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
=======
  mount_uploader :photo, PhotoUploader
>>>>>>> cf9f03087f15f9d6fa05afb19a424538c8f58740
end
