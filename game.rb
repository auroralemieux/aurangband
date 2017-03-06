require_relative 'dungeon'
require_relative 'player'
require_relative 'move'

module Aurangband
  class Game
    PLAYER = "@"

    attr_reader :dungeon, :player

    def initialize
      @dungeon = Aurangband::Dungeon.new
      @column = 0
      @row = 0
    end

    def play
      welcome
      commands
    end

    def quit_game
      print "Are you sure? (y/n) >> "
      choice = gets.chomp.to_s.downcase
      case choice
      when "y", "yes"
        puts "Goodbye!"
        exit!
      when "n", "no"
        commands
      else
        quit_game
      end
    end

    def new_dungeon
      print "What size? (small/medium/large) >> "
      size = gets.chomp.to_s.downcase
      case size
      when "small", "s"
        @dungeon.build_dungeon("small")
      when "medium", "m"
        @dungeon.build_dungeon("medium")
      when "large", "l"
        @dungeon.build_dungeon("large")
      else
        puts "I guess you didn't mean to do that."
      end
      refresh_dungeon
      commands
    end

    def refresh_dungeon
      @dungeon.display_dungeon
    end

    # def locate_player
    #   puts @dungeon.dungeon.index("@") # this won't work since "@" isn't an element of the first level (it's not a row, it's in a row)
    # end

    def move(choice)
      puts "#{@player.name} moves in direction #{choice}."
      directions = {
        "u" => [-1, -1],
        "i" => [-1, 0],
        "o" => [-1, +1],
        "j" => [0, -1],
        "k" => [0, 0],
        "l" => [0, +1],
        "m" => [+1, -1],
        "," => [+1, 0],
        "." => [+1, +1]
      }

      @new_location = @dungeon.dungeon[@row + directions[choice].first][@column + directions[choice].last]
      if @new_location == "#"
        puts "You can't walk into a wall!"
      elsif (@row + directions[choice].first < 0) || (@column + directions[choice].last) < 0
        puts "You can't walk off the edge of the dungeon!"
      else
        @dungeon.dungeon[@row][@column] = "."
        @row += directions[choice].first
        @column += directions[choice].last
        @dungeon.dungeon[@row][@column] = "@"
      end

      refresh_dungeon
      commands
    end

    def commands
      print "\n>> "
      choice = gets.chomp.to_s.downcase
      if %w(u i o j k l m , .).include?(choice)
        move(choice)
      else
        case choice
        when "?", "help"
          help
        when "n", "new"
          new_dungeon
        when "q", "quit", "exit"
          quit_game
        else
          puts "Wha...?"
          commands
        end
      end
    end

    def welcome
      puts "\nWelcome to Aurangband! Dungeon crawling. Yay!"
      puts "Type '?' for help."
      get_name
    end

    def get_name
      print "\nWhat's your name? >> "
      name = gets.chomp.to_s.capitalize
      @player = Aurangband::Player.new(name)
      puts "Hi, #{@player.name}."
    end

    def help
      puts
      puts "AURANGBAND COMMANDS:"
      puts "? -- help"
      puts "n -- new game board"
      puts
      puts "Movement is numkeypad style, with k at the center:"
      puts
      puts "u i o"
      puts "j k l"
      puts "m , ."
      puts
      commands
    end

  end # end of class

end # end of module

game = Aurangband::Game.new
game.play
# game.locate_player
