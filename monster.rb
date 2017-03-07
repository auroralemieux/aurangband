module Aurangband
  class Monster

    attr_reader :char, :message

    MONSTERS = [
      { char: "D",
        name: "Ancient Dragon",
        message: "Rawr!"
      },
      { char: "f",
        name: "Feline",
        message: "Purr!"
      },
      { char: "T",
        name: "Forest Troll",
        message: "Grrrlk!"
      }
    ]
    def initialize
      monster = MONSTERS.sample
      @char = monster[:char]
      @message = monster[:message]
      @name = monster[:name]
      # @location 
      @inventory = Inventory.new
    end

    def talk
      puts "#{@name} says '#{@message}'"
    end

    def inventory_empty?
      @inventory.items.empty? ? true : false
    end

    def drop
      if !inventory_empty?
        item = @inventory.items.sample
        @inventory.items.delete(item)
        puts "The #{@name} dropped #{@item.article} #{@item.name}."
        # THE Floor TILE IT'S ON NEEDS TO UPDATE its items inventory
      end
    end

    def pick_up
      # add item on floor to the inventory
    end

    def move
      # monsters move randomly -- but still follow the rules of floor only
      # if there are walls blocking them they cannot dig
    end

  end
end
#
# monster = Aurangband::Monster.new
# puts monster.talk
# puts monster.message
