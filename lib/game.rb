require './lib/cell'
require './lib/ship'
require './lib/player'
require './lib/board'

class Game

  attr_reader :computer,
              :human,
              :valid

  def initialize
    @computer = Player.new('computer')
    @human = Player.new('human')
  end

  # def welcome
  #
  #   puts "Welcome to BATTLESHIP"
  #   puts "Enter p to play. Enter q to quit"
  #   input = gets.chomp
  #
  #
  #     if input == "p" || input == "P"
  #       self.start_game
  #     elsif input == 'q' || input == "Q"
  #       exit
  #     else
  #       puts 'INVALID INPUT'
  #       self.welcome
  #     end
  # end

  def start_game
    @computer = Player.new(:computer)
    @player = Player.new(:human)


  end



  def place_ships_ai

    trial_coordinates = []

    @computer.ships.each do |ship|

      trial_coordinates = @computer.board.cells.keys.sample(ship.length)

      while @computer.board.valid_placement?(ship, trial_coordinates) == false
        trial_coordinates = @computer.board.cells.keys.sample(ship.length)
      end #ends while

    @computer.board.place(ship, trial_coordinates)
  end #ends each
  end #end of place ships ai method



end #ends class



binding.pry
