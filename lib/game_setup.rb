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



end #ends class
