class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # user has many dungles
  has_many :dungles, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { in: 2..50 }
  validates :bio, lenght: { maximum: 500 }
end
