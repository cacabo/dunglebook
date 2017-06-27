class Dungle < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :performance, presence: true
  validates :ambience, presence: true
  validates :scent, presence: true
  validates :cleanliness, presence: true
  validates :traffic, presence: true
end
