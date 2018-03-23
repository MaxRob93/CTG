class MealProvider < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
  include PgSearch
  pg_search_scope :search_req, :against => [:name, :address, :category],    associated_against: {
      meals: [ :name, :description, :price_cents]
    }

end
