require_relative 'item'

module Aurangband
  class Inventory

    attr_reader :items, :creatures

    def initialize
      @creatures = []
      @items = []
    end

    def list_inventory
      if @items.empty?
        puts "Nothing in inventory."
      else
        puts "\nInventory: "
        n = 1
        @items.map do |item|
          if item.class == Aurangband::Item
            puts "#{n}. #{item.name}"
            n += 1
          end
        end
      end
    end

    def add_item(item)
      @items << item
    end

    def drop_item
      list_inventory
      puts "You drop #{@items[number-1].article} #{@items[number-1].name}. It's gone forever!"
      @items.delete_at(number - 1)
    end


  end
end
# new_inventory = Aurangband::Inventory.new
# new_inventory.list_inventory
# new_inventory.drop_item(2)
# new_inventory.list_inventory
