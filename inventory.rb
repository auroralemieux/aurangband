module Aurangband
  class Inventory

    attr_reader :items

    def initialize
      @items = []
    end

    def inventory
      puts "\nInventory: "
      @items.map { |item| puts item }
    end

  end
end
