module Aurangband
  class Monster

    attr_reader :char, :message

    MONSTERS = [
      { map_char: "D",
        name: "Ancient Dragon",
        message: "Rawr!"
      },
      { map_char: "f",
        name: "Feline",
        message: "Purr!"
      },
      { map_char: "T",
        name: "Forest Troll",
        message: "Grrrlk!"
      }
    ]
    def initialize
      monster = MONSTERS.sample
      @char = monster[:map_char]
      @message = monster[:message]
      @name = monster[:name]
      @inventory = Inventory.new
    end

    def talk
      puts "#{@name} says '#{@message}'"
    end

    def inventory_empty?
      @inventory.empty? ? true : false
    end

    def drop
      if !inventory_empty?
        #drop something randomly on the tile it's on
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
