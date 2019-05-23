class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flats
  # booking requests i made on someone elses flat
  has_many :bookings
  # booking requests other people made on my flats
  has_many :received_bookings, through: :flats, source: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, confirmation: { case_sensitive: false }

end
