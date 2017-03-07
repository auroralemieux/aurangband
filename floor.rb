module Aurangband
  class Floor
    attr_reader :inventory, :char

    def initialize
      @char = "."
      @inventory = Inventory.new
      # @location
      @occupied = occupied?
    end

    def occupied?
      if @inventory.creatures.empty?
        return false
      else
        return true
      end
    end

    def add(item)
      @inventory << item
    end

    def remove(item)
      @inventory.delete(item)
    end

    def leave
      @inventory.creatures.delete_at(0)
      @char = "."
    end

    def arrive(who)
      if !occupied?
        @inventory.creatures.push(who)
        @char = @inventory.creatures.first.char
      else
        puts "A #{@inventory.creatures.first.class} is in that space!"
      end
    end

  end
end

# a floor object is part of a dungeon
