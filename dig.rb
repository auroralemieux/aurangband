module Aurangband
  class Dig
    attr_reader
    def initialization
    end

    def self.dig(dig_direction)
      @dig_location = @dungeon.dungeon[@row + @directions[dig_direction].first][@column + @directions[dig_direction].last]
      if @dig_location != "#"
        puts "You can't dig there!"
      else
        @dungeon.dungeon[@row + @directions[dig_direction].first][@column + @directions[dig_direction].last] = "."
      end

    end

  end

end
