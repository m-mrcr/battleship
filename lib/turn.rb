require './lib/player'
require './lib/board'
require './lib/game'
require './lib/cell'

class Turn

  def initialize(human, computer)
    @human = human
    @computer = computer
  end


    def display_boards
      puts "=============COMPUTER BOARD============="
      puts @computer.board.render
      puts "==============PLAYER BOARD=============="
      puts @human.board.render(true)
    end

    def player_chooses_coordinate
      puts "Enter the coordinate for your shot: \n"
      input = gets.upcase.chomp

      already_fired_upon_coordinates = []

      loop do
        if already_fired_upon_coordinates.include?(input)
          puts "This coordinate has already been fired upon. Please choose another."
          next
        end

        if @computer.board.valid_coordinate?(input)
          @computer.board.cells[input].fire_upon
          already_fired_upon_coordinates.push(input)
          break
        else
          puts "Please enter a valid coordinate: "
        end #end of it
      end #end of loop do

      status =  @computer.board.cells[input].render

      case status

        when 'H'
          puts "Your shot on #{input} was a hit."
        when 'M'
          puts "Your shot on #{input} was a miss."
        when 'X'
          puts "Your shot on #{input} sunk a ship."
      end #ends case



    end #end of player_chooses_coordinate method

    def computer_chooses_coordinate
      possible_coords = @human.board.cells.values.delete_if {|cell| cell.fired_upon? == true}

      coordinate = possible_coords.sample

      loop do
        if @human.board.valid_coordinate?(coordinate) == true
          @human.board.cells[coordinate].fire_upon
          break
        end
      end #end of loop

    status =  @human.board.cells[coordinate].render

    case status
      when 'H'
        puts "My shot on #{coordinate} was a hit."
      when 'M'
        puts "My shot on #{coordinate} was a miss."
      when 'X'
        puts "My shot on #{coordinate} sunk a ship."
    end #ends case



    end #end of method






  def player_won
    if @computer.ships.all? do |name_of_ship, ship|
      ship.sunk? == true
      end
      return true
    else
      return false
    end

  end #end of player won method

  def computer_won
    if @human.ships.all? do |name_of_ship, ship|
      ship.sunk? == true
      end
      return true
    else
      return false
    end #ends if else
  end #ends method



end
