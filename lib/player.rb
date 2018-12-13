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


  def place_ships_loop

    ships.each do |name, ship|

      loop do
        puts "Enter the coordinates for the #{ship.name} which is #{ship.length} spaces long. \n"
        input = gets.chomp.upcase.split

        if board.valid_placement?(ship, input)
          board.place(ship, input)
          board.render(true)
          break
        else
          puts "Those are invalid coordinates. Please try again."
        end
      end
    end #end loop
end #ends place_ships_loop

  def place_ships_ai
    trial_coordinates = []

    ships.each do |name_of_ship, ship|

      loop do

        trial_coordinates = board.cells.keys.sample(ship.length)

        if board.valid_placement?(ship, trial_coordinates)
          board.place(ship, trial_coordinates)
          break
        end

      end #end of loop do
    end #ends each
  end #end of place ships ai method

end
