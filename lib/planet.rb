# frozen_string_literal: true
#require 'pry'

class Planet
  attr_reader :name, :gravity

  def initialize(name, gravity)
    @name = name
    @gravity = gravity
  end
end
