require_relative 'dungeon'
require_relative 'player'
require_relative 'move'
require_relative 'monster'

module Aurangband
  class Game
    # PLAYER = "@"

    attr_reader :dungeon, :player, :directions

    def initialize
      @dungeon = Aurangband::Dungeon.new
      # @player = Aurangband::Player.new
      # this is the location of the player -- starts in the top left corner
      # @column = 0
      # @row = 0
      @directions = {
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
    end

    def play
      welcome
      new_dungeon
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
      # @dungeon.dungeon[0][0] = @player
      refresh_dungeon
    end

    def refresh_dungeon
      # puts @dungeon.dungeon
      @dungeon.display_dungeon
    end

    def inventory
      @dungeon.player.list_inventory
    end

    def commands
      print "\n>> "
      choice = gets.chomp.to_s.downcase
      if %w(u i o j k l m , .).include?(choice)
        player_move(@directions[choice])
        # monster_move # write this
        refresh_dungeon
        commands
      else
        case choice
        when "?", "help"
          help
        when "d", "dig"
          print "What direction are you digging in? >> "
          dig_direction = gets.chomp.to_s.downcase
          if %w(u i o j l m , .).include?(dig_direction)
            dig(@directions[dig_direction])
            refresh_dungeon
          else
            puts "Sorry, that's not a valid direction."
          end
        when "n", "new"
          print "Do you really want to start a new game? (yes/no) >> "
          start_new = gets.chomp.downcase
          case start_new
          when "yes", "y"
            new_dungeon
          when "no", "n"
            commands
          else
            puts "What was I saying? Oh..."
            commands
          end
        when "i", "inventory"
          inventory
        when "q", "quit", "exit"
          quit_game
        else
          puts "Wha...?"
          # commands
        end
        commands
      end
    end

    def monster_move
      @dungeon.each do |row|
        row.each do |space|
          if space.class == Aurangband::Monster
            space.talk # for now to see if they are all being caught
            # roll a random number
            # if it's 1
            # the monster checks its surroundings
            # and moves to a random possible place
          end
        end
      end
    end

    def player_move(choice)
      @row = @dungeon.player.location[0]
      @column = @dungeon.player.location[1]
      puts "@row is #{@row}"
      puts "@column is #{@column}"
      puts "#{choice.first} choice.first"
      puts "#{choice.last} choice.last"
      @current_location = @dungeon.dungeon[@row][@column]
      @new_location = @dungeon.dungeon[@row + choice.first][@column + choice.last]
      puts "class is #{@new_location.class}"
      if @new_location.class == Aurangband::Wall # if it's a wall
        puts "You can't walk into a wall!"
      elsif (@row + choice.first < 0) || (@column + choice.last) < 0 # if it's going off the board
        puts "You can't walk off the edge of the dungeon!"
      elsif @new_location.occupied? # if there's a monster there
        # @new_location.inventory.creatures[0].talk # talk to it
        puts "hey monster!"
      else # it's a floor tile
        @current_location.leave
        @dungeon.player.location[0] += choice.first
        @dungeon.player.location[1] += choice.last
        @new_location.arrive(@dungeon.player)
        # @dungeon.dungeon[@row][@column].
      end
    end

    def dig(dig_direction)
      @dig_location = @dungeon.dungeon[@row + dig_direction.first][@column + dig_direction.last]
      if @dig_location.class != Aurangband::Wall
        puts "You can't dig there!"
      else
        @dungeon.dungeon[@row + dig_direction[0]][@column + dig_direction[1]] = Aurangband::Floor.new
      end
    end

    def welcome
      puts "\nWelcome to Aurangband! Dungeon crawling. Yay!"
      puts "Type '?' for help."
      @dungeon.player.get_name
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
