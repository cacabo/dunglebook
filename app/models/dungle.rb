class Dungle < ApplicationRecord
  belongs_to :user
  has_one :location

  validates :user_id, presence: true
  validates :performance, presence: true
  validates :ambience, presence: true
  validates :scent, presence: true
  validates :cleanliness, presence: true
  validates :traffic, presence: true

  validates_inclusion_of :performance, :in => 1..5
  validates_inclusion_of :ambience, :in => 1..5
  validates_inclusion_of :scent, :in => 1..5
  validates_inclusion_of :cleanliness, :in => 1..5
  validates_inclusion_of :traffic, :in => 1..5
end
