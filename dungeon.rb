require_relative 'monster'
require_relative 'floor'
require_relative 'wall'
require_relative 'player'
require_relative 'inventory'
require_relative 'item'

module Aurangband
  class Dungeon
    attr_accessor :dungeon, :monster
    WALL = Aurangband::Wall.new
    FLOOR = Aurangband::Floor.new
    PLAYER = Aurangband::Player.new
    ITEM = Aurangband::Item.new
    MONSTER = Aurangband::Monster.new

    def initialize
      @sizes = {
        "small" => [20, 10],
        "medium" => [30, 15],
        "large" => [40, 20]
      }
    end

    def generate_map_elements
      @elements = []
      25.times { @elements << WALL.char }
      25.times { @elements << FLOOR.char }
      1.times { @elements << ITEM.char }
      3.times { @elements << Aurangband::Monster.new.char }
      return @elements
    end

    def build_dungeon(size)
      generate_map_elements
      @dungeon = []
      @sizes[size].last.times do |row|
        row = []
        @sizes[size].first.times do |column|
          row << @elements.sample
        end
        @dungeon << row
      end
      @dungeon[0][0] = PLAYER.char
      return @dungeon
    end

    def display_dungeon
      @dungeon.map { |row| puts row.join }
    end

  end
end

new_dungeon = Aurangband::Dungeon.new
new_dungeon.build_dungeon("large")
new_dungeon.display_dungeon
