# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :user
  has_many :spots_bookings, dependent: :destroy
  has_many :spots, through: :spots_bookings

  validates :start_time, :end_time, :status, :price, presence: true
end