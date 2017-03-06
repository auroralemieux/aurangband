require_relative 'dungeon'
require_relative 'player'
require_relative 'game'

module Aurangband
  class Move

    attr_reader :player

    def initialize
      @player = [0,0]
    end


    # movement of the player in the dungeon
    # accept direction input (roguelike)
    # i up, , down, j left, l right, u diag up left, o diag up right, m diag down left, . diag down right
    # directions access coordinates on the array
      # check to see if space contains "#"
        # if does, no move
        # if doesn't, move player
    # move player
    # board reprints after each move
  end
end
