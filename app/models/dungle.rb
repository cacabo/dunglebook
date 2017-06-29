class Dungle < ApplicationRecord
  belongs_to :user

  # geocode the location / address to longitude and latitude
  geocoded_by :location_title
  after_validation :geocode

  validates :user_id, presence: true
  validates :title, presence: true
  validates :performance, presence: true
  validates :ambience, presence: true
  validates :scent, presence: true
  validates :cleanliness, presence: true
  validates :traffic, presence: true
  validates :location_title, presence: true

  validates :title, length: { in: 3..160 }
  validates :description, length: { in: 20..10000 }
  validates :location_title, length: { in: 2..1000 }

  validates_inclusion_of :performance, :in => 1..5
  validates_inclusion_of :ambience, :in => 1..5
  validates_inclusion_of :scent, :in => 1..5
  validates_inclusion_of :cleanliness, :in => 1..5
  validates_inclusion_of :traffic, :in => 1..5
end
