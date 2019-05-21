class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flats, through: :bookings
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, confirmation: { case_sensitive: false }
end
