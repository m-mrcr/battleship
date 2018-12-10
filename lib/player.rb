require './lib/board'
require 'pry'

class Player

  attr_reader :ships,
              :board

  def initialize(name)
    @name = name
    @board = Board.new
    @ships = Hash.new
    add_ships
  end

  def add_ships
    @ships = {submarine: Ship.new("Submarine", 2), cruiser: Ship.new("Cruiser", 3) }
  end
  
end
