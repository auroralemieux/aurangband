module Aurangband
  class Floor
    attr_reader :inventory, :char

    def initialize
      @char = "."
      @inventory = Inventory.new
    end

    def add(item)
      @inventory << item
    end

    def remove(item)
      @inventory.delete(item)
    end

  end
end

# a floor object is part of a dungeon
