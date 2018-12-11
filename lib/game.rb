require './lib/cell'
require './lib/ship'
require './lib/game_play'
require './lib/player'
require './lib/board'
require 'pry'

class Game

  attr_reader :computer,
              :human

  def initialize
    @computer = Player.new('computer')
    @human = Player.new('human')
    self.welcome
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    input = gets.chomp

      if input == "p" || input == "P"
        self.start_game
      elsif input == 'q' || input == "Q"
        exit
      else
        puts 'INVALID INPUT'
        self.welcome
      end
  end

  def start_game
    @computer = Player.new(:computer)
    @player = Player.new(:human)
  end

  def setup
    place_ships_ai
    place_ships_user
  end

  def place_ships_user
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is two units long and the Submarine is three units long."
    puts @human.board.render

    loop do
      puts "Enter the squares for the Cruiser (3 spaces). Ex: (A1 A2 A3) \n"
      input = gets.chomp.upcase
      input_cruiser = input.split


      if @human.board.valid_placement?(@human.ships[:cruiser], input_cruiser) == true
        @human.board.place(@human.ships[:cruiser], input_cruiser)
        @human.board.render(true)
        break
      else
        puts "Those are invalid coordinates. Please try again."
      end
    end #end loop

  loop do
    puts "Enter the squares for the Submarine (2 spaces): \n"
    input = gets.chomp.upcase
    input_submarine = input.split

    if @human.board.valid_placement?(@human.ships[:submarine], input_submarine) == true
      @human.board.place(@human.ships[:submarine], input_submarine)
      @human.board.render(true)
      break
    else
      puts "Those are invalid coordinates. Please try again."
    end
  end

  puts @human.board.render(true)

  end


  def place_ships_ai
    trial_coordinates = []

    @computer.ships.each do |name_of_ship, ship|

      loop do

        trial_coordinates = @computer.board.cells.keys.sample(ship.length)

        if @computer.board.valid_placement?(ship, trial_coordinates) == true
          @computer.board.place(ship, trial_coordinates)
          puts " The computer has placed its #{name_of_ship}."
          break
        end

      end #end of loop do
    end #ends each
  end #end of place ships ai method

end #ends class
