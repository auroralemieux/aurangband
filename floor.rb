module Aurangband
  class Floor
    attr_reader :inventory, :char, :occupied

    def initialize
      @inventory = Inventory.new
      occupied?

      char_display
      # @location
    end

    def occupied?
      if @inventory.creatures.empty? && @inventory.items.empty?
        @occupied = false
      else
        @occupied = true
      end
      return @occupied
    end

    def char_display
      if !@occupied && !@inventory.items.empty?
        @char = @inventory.items[0].char #if items but no creatures
      elsif !@occupied && @inventory.items.empty?
        @char = "." # if no creatures and no items
      else
        @char = @inventory.creatures[0].char # if no items but a creature
      end
    end

    def add(item)
      @inventory.items << item
      char_display
    end

    def remove(item)
      @inventory.items.delete(item)
      char_display
    end

    def leave
      @inventory.creatures.delete_at(0)
      char_display
    end

    def arrive(who)
      if !occupied?
        @inventory.creatures.push(who)
      # else
      #   puts "A #{@inventory.creatures[0].name} is in that space!"
      end
      char_display
    end

  end
end

# a floor object is part of a dungeon
