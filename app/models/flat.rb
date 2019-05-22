class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :address, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true
  validates :capacity, presence: true, numericality: { only_integer: true }
  # validates :picture, :lat, :long, :price, :description, presence: true
  mount_uploader :picture, PhotoUploader
end
