require './lib/player'
require './lib/board'

class Game

  attr_reader :computer,
              :human

  def initialize
    welcome
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
    place_ships_ai

  end



  def place_ships_ai
    valid = false
    while valid == false

      @computer.ships.each do |ship|
        @computer.board.cells.sample

      end

    end
  end

binding.pry
end
