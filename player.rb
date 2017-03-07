# require_relative 'dungeon'
# require_relative 'move'
# require_relative 'game'

module Aurangband
  class Player

    attr_accessor :location, :name

    def initialize
      # @name is set in get_name
      # location coordinates are y,x
      # @location = [0,0]
      @directions = {
        "u" => [-1, -1],
        "i" => [-1, 0],
        "o" => [-1, +1],
        "j" => [0, -1],
        "k" => [0, 0],
        "l" => [0, +1],
        "m" => [+1, -1],
        "," => [+1, 0],
        "." => [+1, +1]
      }
      @inventory = Inventory.new
    end

    def get_name
      print "\nWhat's your name? >> "
      @name = gets.chomp.to_s.capitalize
      puts "Hi, #{@name}."
    end

    def pick_up
      # can pick up an item from the floor
      # @inventory << item
      # puts "You have a(n) #{item}."
    end

    def drop
      # can drop an item from inventory
      # @inventory.delete(item)
      # puts "You drop the #{item}."
    end

    def dig(dig_direction)
      @dig_location = @dungeon.dungeon[@row + @directions[dig_direction].first][@column + @directions[dig_direction].last]
      if @dig_location != "#"
        puts "You can't dig there!"
      else
        @dungeon.dungeon[@row + @directions[dig_direction].first][@column + @directions[dig_direction].last] = "."
      end

    end

    def move(choice)
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


    def place_initially
    end

    def move(direction)
    end

    # player moves in the dungeon
    # player is a coordinate on an array of arrays blank

  end
end
