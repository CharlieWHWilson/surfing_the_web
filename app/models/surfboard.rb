class Surfboard < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  enum :status, { pending: 0, approve: 1, decline: 2 }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
