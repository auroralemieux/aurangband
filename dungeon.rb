require_relative 'monster'
require_relative 'floor'
require_relative 'wall'
require_relative 'player'
require_relative 'inventory'
require_relative 'item'


# need to build in the location coordinates for each map object
# everything has a location
# if a wall becomes a floor it passes on its location
# should be able to list all objects at a location given a location (class method) ?

module Aurangband
  class Dungeon
    attr_accessor :dungeon, :monster, :player
    WALL = Aurangband::Wall.new
    FLOOR = Aurangband::Floor.new
    PLAYER = Aurangband::Player.new
    ITEM = Aurangband::Item.new
    MONSTER = Aurangband::Monster.new

    def initialize
      @player = PLAYER
      @sizes = {
        "small" => [20, 10],
        "medium" => [30, 15],
        "large" => [40, 20]
      }
    end

    def generate_map_elements
      @elements = []
      25.times { @elements << WALL }
      25.times { @elements << FLOOR }
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
      populate_dungeon_elements_with_items_and_monsters
      # player_starts_on_floor_space
      return @dungeon
    end

    def populate_dungeon_elements_with_items_and_monsters
      @dungeon.each do |row|
        row.each do |element|
          if element.class == Floor
            # puts "class was Floor"
            num = rand(10)
            if num == 5
              element.add(ITEM)

              # puts "added item!"
            elsif num == 8 # || num == 3
              element.arrive(MONSTER)

              # puts "added monster!"
            end
            element.char_display
          end
        end
      end
      player_starts_on_floor_space

    end

    def player_starts_on_floor_space

      @dungeon[0][0] = FLOOR
      @dungeon[0][0].leave # in case there are any monsters there
      @dungeon[0][0].arrive(@player)
      @dungeon[0][0].char_display
      puts "placed the player"
    end

    def display_dungeon
      @dungeon.each do |row|
        # puts "#{row}"
        row.each do |element|
          puts "element.char is #{element.char}"
          # print element.char 
        end
        puts
      end
    end

  end
end
#
# new_dungeon = Aurangband::Dungeon.new
# new_dungeon.build_dungeon("large")
# new_dungeon.display_dungeon
