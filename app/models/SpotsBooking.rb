# frozen_string_literal: true

class SpotsBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :spot

  validates :booking_id, :spot_id, presence: true
end