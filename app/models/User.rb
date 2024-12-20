# frozen_string_literal: true

class User < ApplicationRecord
  has_many :spaces, foreign_key: :creator_id, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
end