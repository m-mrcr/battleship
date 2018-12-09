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
    self.place_ships_ai

  end



  def place_ships_ai

    # valid = false
    # while valid == false

      @computer.ships.each do |ship|
        initial_cell = @computer.board.cells.values.sample
        orientation = [:horizontal, :vertical]


          if orientation.sample == :horizontal
            trial_coordinates = get_horizontal_coordinates(initial_cell, ship)
            binding.pry

            if trial_coordinates.all? do |coordinate|
              @computer.board.valid_coordinate?(coordinate)
            end

              valid_coordinates = trial_coordinates
                if @computer.board.valid_placement?(ship, valid_coordinates)
                  @computer.board.place(ship, valid_coordinates)
                else
                  binding.pry
                  self.place_ships_ai
                end
            end




          else
            get_horizontal_coordinates(initial_cell, ship)
          end

      end
    # end

  end



def get_horizontal_coordinates(initial_cell, ship)
  columns = []

  letter = initial_cell.coordinate.chars[0]
  initial_column = initial_cell.coordinate.chars[1].to_i
  columns << initial_column


  if [:east, :west].sample == :east
    until ship.length == columns.length
      column = initial_column + 1
      columns << column
    end


  else
    until ship.length == columns.length
      column = initial_column - 1
      columns << column
    end
  end

columns = columns.map do |column|
  column.to_s
end

coordinates = columns.map do |number|
  letter + number
end




end


end

binding.pry
