require_relative 'dungeon'
require_relative 'player'
require_relative 'game'

module Aurangband
  class Move

    attr_reader #:player

    def initialize
      # @player = [0,0]
    end

    def self.move(choice)
      puts "#{@player.name} moves in direction #{choice}."
      @new_location = @dungeon.dungeon[@row + @directions[choice].first][@column + @directions[choice].last]
      if @new_location == "#"
        puts "You can't walk into a wall!"
      elsif (@row + @directions[choice].first < 0) || (@column + @directions[choice].last) < 0
        puts "You can't walk off the edge of the dungeon!"
      elsif ["D", "f"].include?(@new_location)
        @dungeon.monster.talk
      else
        @dungeon.dungeon[@row][@column] = "."
        @row += @directions[choice].first
        @column += @directions[choice].last
        @dungeon.dungeon[@row][@column] = "@"
      end
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
