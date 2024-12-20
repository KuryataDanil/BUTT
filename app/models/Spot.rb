# frozen_string_literal: true

class Spot < ApplicationRecord
  belongs_to :space
  has_many :spots_bookings, dependent: :destroy
  has_many :bookings, through: :spots_bookings

  validates :x, :y, :size, :num, :price, :time, :time_measure, presence: true
end