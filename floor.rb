module Aurangband
  class Floor
    attr_reader :inventory, :char, :occupied

    def initialize
      @char = char_display
      @inventory = Inventory.new
      # @location
      @occupied = occupied?
    end

    def occupied?
      if @inventory.creatures.empty? && @inventory.items.empty?
        return false
      else
        return true
      end
    end

    def char_display
      if !@occupied && !@inventory.items.empty?
        @char = @inventory.items.first.char #if items but no creatures
      elsif !@occupied && @inventory.items.empty?
        @char = "." # if no creatures and no items
      else
        @char = @inventory.creatures.first.char # if no items but a creature
      end
    end

    def add(item)
      @inventory.items << item
    end

    def remove(item)
      @inventory.items.delete(item)
    end

    def leave
      @inventory.creatures.delete_at(0)
    end

    def arrive(who)
      if !occupied?
        @inventory.creatures.push(who)
      else
        puts "A #{@inventory.creatures.first.class} is in that space!"
      end
    end

  end
end

# a floor object is part of a dungeon
