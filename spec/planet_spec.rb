# frozen_string_literal: true
#require 'pry'

require 'rspec'
require_relative '../lib/planet'

describe Planet do
  describe '#initialize' do
    it 'creates a new planet object with name and gravity' do
      planet = Planet.new('Earth', 9.807)
      expect(planet.name).to eq('Earth')
      expect(planet.gravity).to eq(9.807)
    end
  end
end
