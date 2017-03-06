module Aurangband
  class Dungeon
    attr_accessor :dungeon
    WALL = "#"
    FLOOR = "."
    PLAYER = "@"

    def initialize
    end

    def build_dungeon(size)
      sizes = {
        "small" => [20, 10],
        "medium" => [30, 15],
        "large" => [40, 20]
      }
      elements = [WALL, FLOOR]
      @dungeon = []
      sizes[size].last.times do |row|
        row = []
        sizes[size].first.times do |column|
          row << elements.sample
        end
        @dungeon << row
      end
      @dungeon[0][0] = PLAYER
      return @dungeon
    end

    def display_dungeon
      # display_player
      @dungeon.map { |row| puts row.join }
    end

    # def display_player
    #   @dungeon[0][0] = PLAYER
    # end


  end
end
