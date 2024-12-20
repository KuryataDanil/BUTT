# frozen_string_literal: true

class SpaceObject < ApplicationRecord
  belongs_to :space

  validates :x, :y, :size_x, :size_y, :angle, presence: true
end