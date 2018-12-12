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
    custom_board_size
    create_boards
    place_ships_ai
    place_ships_user
  end

  def place_ships_ai
    @computer.place_ships_ai
  end #end of place ships ai method

  def place_ships_user
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your own ships."
    puts @human.board.render

    @human.place_ships_loop
    puts @human.board.render(true)
  end #ends place_ships_user

  def custom_board_size
    puts "You can choose the board size, limited to 26X26."
    puts "Input a letter for the height: "
    @height = gets.chomp.upcase
    puts "Now input a number for width: "
    @width = gets.chomp.upcase.to_i

  end

  def create_boards
    @human.board.create_cells(@height, @width)
    @computer.board.create_cells(@height, @width)
  end

end #ends class
