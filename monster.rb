module Aurangband
  class Monster

    attr_reader :char, :message

    MONSTERS = [
      { map_char: "D",
        message: "I'm an Ancient Dragon! Rawr!",
      },
      { map_char: "f",
        message: "I'm a Feline! Purr!"
      }
    ]
    def initialize
      @monster = MONSTERS.sample
      @char = @monster[:map_char]
      @message = @monster[:message]
    end

    def talk
      puts "#{@char} says '#{@message}'"
    end


  end
end
#
# monster = Aurangband::Monster.new
# puts monster.talk
# puts monster.message
