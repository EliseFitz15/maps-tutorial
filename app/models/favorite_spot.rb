class FavoriteSpot < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :location_name, presence: true, length: { maximum: 40 }
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(favorite_spot){ favorite_spot.address.present? and favorite_spot.address_changed? }
end
