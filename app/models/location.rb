class Location < ApplicationRecord
  belongs_to :dungle
  geocoded_by :full_street_address
  after_validation :geocode
end
