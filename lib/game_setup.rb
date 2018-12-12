require './lib/cell'
require './lib/ship'
require './lib/game_play'
require './lib/player'
require './lib/board'
require 'pry'

class GameSetup

  attr_reader :computer,
              :human

  def initialize
    @computer = Player.new(:computer)
    @human = Player.new(:human)

  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    input = gets.chomp

      if input == "p" || input == "P"
        setup
      elsif input == 'q' || input == "Q"
        exit
      else
        puts 'INVALID INPUT'
        welcome
      end
  end


  def setup
    place_ships_ai
    place_ships_user
  end

  def place_ships_loop

    @human.ships.each do |name, ship|

      loop do
        puts "Separated by spaces, enter the coordinates for the #{ship.name} which is #{ship.length} spaces long. \n"
        input = gets.chomp.upcase.split

        if @human.board.valid_placement?(ship, input)
          @human.board.place(ship, input)
          @human.board.render(true)
          break
        else
          puts "Those are invalid coordinates. Please try again."
        end
      end
    end
  #end loop
  end

def place_ships_user
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    # puts "The Cruiser is three units long and the Submarine is two units long."
    puts @human.board.render

  place_ships_loop
   puts @human.board.render(true)

  end



  def place_ships_ai
    @computer.place_ships_ai
  end #end of place ships ai method

end #ends class
