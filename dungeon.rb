require_relative 'monster'


module Aurangband
  class Dungeon
    attr_accessor :dungeon, :monster
    WALL = "#"
    FLOOR = "."
    PLAYER = "@"

    def initialize
      new_monster
    end

    def new_monster
      @monster = Aurangband::Monster.new
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
      @dungeon[1][1] = @monster.char
      return @dungeon
    end

    def display_dungeon
      @dungeon.map { |row| puts row.join }
    end

  end
end
