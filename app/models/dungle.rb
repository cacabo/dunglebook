class Dungle < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :performance, presence: true
  validates :ambience, presence: true
  validates :scent, presence: true
  validates :cleanliness, presence: true
  validates :traffic, presence: true

  validates_inclusion_of :performance, :in => 0..5
  validates_inclusion_of :ambience, :in => 0..5
  validates_inclusion_of :scent, :in => 0..5
  validates_inclusion_of :cleanliness, :in => 0..5
  validates_inclusion_of :traffic, :in => 0..5
end
