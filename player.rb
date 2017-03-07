# require_relative 'dungeon'
# require_relative 'move'
# require_relative 'game'

module Aurangband
  class Player

    attr_accessor :location, :name, :char, :inventory

    def initialize
      # @name is set in get_name
      # location coordinates are row, column
      @inventory = Inventory.new
      @char = "@"
      @location = [0,0]
      # @location
    end

    def get_name
      print "\nWhat's your name? >> "
      @name = gets.chomp.to_s.capitalize
      puts "Hi, #{@name}."
    end

    def pick_up
      new_item = Item.new
      @inventory.add_item(new_item)
    end

    def list_inventory
      @inventory.list_inventory
    end

    def drop
      @inventory.drop_item
    end

  end
end
