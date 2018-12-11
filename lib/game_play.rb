require './lib/player'
require './lib/board'
require './lib/cell'
require 'pry'

class GamePlay

  attr_reader :human,
              :computer

  def initialize(human, computer)
    @human = human
    @computer = computer
    @already_fired_upon_coordinates_human = []
    @already_fired_upon_coordinates_computer = []
  end


    def display_boards
      sleep(1)
      puts "=============COMPUTER BOARD============="
      puts @computer.board.render
      puts "==============PLAYER BOARD=============="
      puts @human.board.render(true)
    end

    def player_chooses_coordinate
      puts "Enter the coordinate for your shot: \n"
      input = gets.upcase.chomp


      loop do

        if @computer.board.valid_coordinate?(input) && @already_fired_upon_coordinates_human.include?(input) == false
          @computer.board.cells[input].fire_upon
          @already_fired_upon_coordinates_human << input
          break
        elsif @already_fired_upon_coordinates_human.include?(input) == true
          puts "This coordinate has already been fired upon. Please choose another."
          input = gets.upcase.chomp
          next
        else
          puts "Please enter a valid coordinate: "
            input = gets.upcase.chomp
          next
        end #end of first if
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

      all_possible_coordinates = @human.board.cells.keys
      coordinate = all_possible_coordinates.sample

      loop do

        if @already_fired_upon_coordinates_computer.include?(coordinate) == false
          @human.board.cells[coordinate].fire_upon
          @already_fired_upon_coordinates_computer.push(coordinate)
          break
        end
        coordinate = all_possible_coordinates.sample
      end #end of loop

    status = @human.board.cells[coordinate].render

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
      ship.sunk?
      end
      return true
    else
      return false
    end #ends if else
  end #ends method

  def end_game_announcement
    if player_won
      puts "\n ------------ \n \n Congratulations, you won! \n \n ------------ \n"
    elsif computer_won == true
      puts "\n ------------ \n \n I won. Better luck next time. \n \n ------------ \n"
    end
  end

end
