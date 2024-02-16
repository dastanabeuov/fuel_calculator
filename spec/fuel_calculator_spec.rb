# frozen_string_literal: true
#require 'pry'

require 'rspec'
require_relative '../lib/planet'
require_relative '../lib/fuel_calculator'

describe FuelCalculator do
  describe '#calculate_launch_fuel' do
    it 'returns correct fuel for launch' do
      planet = Planet.new('Earth', 9.807)
      calculator = FuelCalculator.new(planet)
      expect(calculator.calculate_launch_fuel(28801)).to eq(11829)
    end
  end

  describe '#calculate_landing_fuel' do
    it 'returns correct fuel for landing' do
      planet = Planet.new('Moon', 1.62)
      calculator = FuelCalculator.new(planet)
      expect(calculator.calculate_landing_fuel(28801)).to eq(1497)
    end
  end
end
