# frozen_string_literal: true

class Space < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :objects, dependent: :destroy
  has_many :spots, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true
end