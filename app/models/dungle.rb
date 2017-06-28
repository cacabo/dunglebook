class Dungle < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :performance, presence: true
  validates :ambience, presence: true
  validates :scent, presence: true
  validates :cleanliness, presence: true
  validates :traffic, presence: true

  validate :location

  validates_inclusion_of :performance, :in => 1..5
  validates_inclusion_of :ambience, :in => 1..5
  validates_inclusion_of :scent, :in => 1..5
  validates_inclusion_of :cleanliness, :in => 1..5
  validates_inclusion_of :traffic, :in => 1..5

  private

  def location
    if location_title.blank? and address.blank?
      errors.add(:base, 'Dungle must have location title or address')
    end
  end
end
