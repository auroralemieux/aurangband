module Aurangband
  class Floor
    attr_reader :inventory, :char, :occupied

    def initialize
      @inventory = Inventory.new

      @char = char_display
      # @location
    end

    def occupied?
      if @inventory.creatures.empty?
        @occupied = false
      else
        @occupied = true
      end
      return @occupied
    end

    def char_display
      occupied?

      if !@occupied && !@inventory.items.empty?
        @char = @inventory.items[0].char #if items but no creatures
        # puts @char
      elsif @occupied && @inventory.items.empty?
        @char = @inventory.creatures[0].char # if no items but a creature
        # puts @char
      else
        @char = "." # if no creatures and no items
        # puts @char
      end
    end

    def add(item)
      occupied?

      @inventory.items << item
      char_display
      # char_display
    end

    def remove(item)
      occupied?

      @inventory.items.delete(item)
      char_display
      # char_display
    end

    def leave
      occupied?

      @inventory.creatures.delete_at(0)
      char_display
      # char_display
    end

    def arrive(who)
      occupied?

      if !occupied?
        @inventory.creatures.push(who)
        char_display
        # else
      #   puts "A #{@inventory.creatures[0].name} is in that space!"
      end
      # char_display
    end

  end
end

# a floor object is part of a dungeon
