# frozen_string_literal: true
#require 'pry'

require 'rspec'
require_relative '../lib/flight_mission'

describe FlightMission do
  describe '#execute_mission' do
    it 'returns correct total fuel for the mission' do
      ship_mass = 28801
      route = [%i[launch earth], %i[land moon], %i[launch moon], %i[land earth]]
      mission = FlightMission.new(ship_mass, route)
      expect(mission.execute_mission).to eq(31562)
    end

    it 'raises ArgumentError for invalid action' do
      ship_mass = 28801
      route = [%i[launch earth], %i[land moon], %i[invalid_action moon]]
      mission = FlightMission.new(ship_mass, route)
      expect { mission.execute_mission }.to raise_error(ArgumentError, /Invalid action/)
    end

    it 'raises ArgumentError for invalid planet name' do
      ship_mass = 28801
      route = [%i[launch earth], %i[land moon], %i[launch invalid_planet]]
      mission = FlightMission.new(ship_mass, route)
      expect { mission.execute_mission }.to raise_error(ArgumentError, /Invalid planet name/)
    end
  end
end
