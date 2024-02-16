# frozen_string_literal: true
#require 'pry'

require_relative 'fuel_calculator'
require_relative 'planet'

class FlightMission
  def initialize(ship_mass, route)
    @ship_mass = ship_mass
    @route = route
    @planets = {
      earth: Planet.new('Earth', 9.807),
      moon: Planet.new('Moon', 1.62),
      mars: Planet.new('Mars', 3.711)
    }

  end

  def execute_mission
    total_fuel = 0
    current_weight = @ship_mass

    @route.each do |action, planet_name|
      planet = @planets[planet_name]
      raise ArgumentError, "Invalid planet name: #{planet_name}" unless planet

      fuel_calculator = FuelCalculator.new(planet)

      case action
      when :launch
        fuel_needed = fuel_calculator.calculate_launch_fuel(current_weight)
      when :land
        fuel_needed = fuel_calculator.calculate_landing_fuel(current_weight)
      else
        raise ArgumentError, "Invalid action: #{action}"
      end

      current_weight += fuel_needed
      total_fuel += fuel_needed
    end

    total_fuel
  end
end
