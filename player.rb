# require_relative 'dungeon'
# require_relative 'move'
# require_relative 'game'

module Aurangband
  class Player

    attr_accessor :location, :name

    def initialize(name)
      @name = name
      # location coordinates are y,x
      # @location = [0,0]
      
    end

    def locate

    end



    def place_initially
    end

    def move(direction)
    end

    # player moves in the dungeon
    # player is a coordinate on an array of arrays blank

  end
end
