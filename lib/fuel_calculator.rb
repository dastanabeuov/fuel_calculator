# frozen_string_literal: true
#require 'pry'

class FuelCalculator
  def initialize(planet)
    @planet = planet
  end

  def calculate_launch_fuel(mass)
    (mass * @planet.gravity * 0.042 - 33).floor
  end

  def calculate_landing_fuel(mass)
    (mass * @planet.gravity * 0.033 - 42).floor
  end
end
