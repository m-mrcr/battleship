require './lib/cell'
class Board

  attr_reader :cells

  def initialize
    @cells = Hash.new
    create_cells
  end

  def create_cells
    letter_coordinates = ("A".."D").to_a
    number_coordinates = (1..4).to_a

    letter_coordinates.each do |letter|

      number_coordinates.each do |number|
        coordinate = "#{letter}#{number}"
        @cells[coordinate] = Cell.new(coordinate)
      end
    end
    @cells
  end #end of method


  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end


  def get_orientation(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0]
    end
    numbers = coordinates.map do |coordinate|
      coordinate[1]
    end


    if letters.all? {|letter| letter == letters[0] }
      return :horizontal

    elsif numbers.all? {|number| number == numbers[0] }
      return :vertical

    else
      return :diagonal
    end

  end #end of method

  def are_the_coordinates_in_the_board?(coordinates)
    if coordinates.all? do |coordinate| #test if all coords are in board
      valid_coordinate?(coordinate)
      end #end of do
      return true
    else
      return false
    end #end of if
  end #end of method


  def are_there_already_ships_here?(coordinates)
    if coordinates.any? do |coordinate| #test if any of these cells has a ship already
      !@cells[coordinate].empty?
      end
      return true
    else
      return false
    end
  end #end of method

  def are_the_coordinates_consecutive?(coordinates)
    orientation = get_orientation(coordinates)

   letters = coordinates.map do |coordinate|
     coordinate[0].ord
   end
   numbers = coordinates.map do |coordinate|
     coordinate[1].to_i
   end


   if orientation == :horizontal
      numbers.each_cons(2) do |first, second|
          if second != first + 1
            return false
          end
        end

        return true

   elsif orientation == :vertical
     letters.each_cons(2) do |first, second|
         if second != first + 1
           return false
         end
       end

       return true

   else
     return false
   end
  end #end of method



  def valid_placement?(ship, coordinates)
    if are_the_coordinates_in_the_board?(coordinates) == false
      return false

    elsif ship.length != coordinates.length   #test if coords are the right length
      return false

    elsif are_there_already_ships_here?(coordinates)
      return false

    elsif are_the_coordinates_consecutive?(coordinates) == false
      return false
    else
      return true
    end

  end


def place(ship, coordinates)

  if valid_placement?(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end

  end

end


  def render(show_ships = false)

      first_row = "  1 2 3 4 \nA"
      third_row = "\nB"
      fourth_row = "\nC"
      fifth_row = "\nD"

      without_cells = [first_row, third_row, fourth_row, fifth_row]
      with_cells = []

      cells =  @cells.values

      cells.each do |cell|

      if show_ships == false
        with_cells << cell.render
      else
        with_cells << cell.render(true)
      end
      end

     rendered_cells = with_cells.each_slice(4).to_a

     without_cells.zip(rendered_cells).flatten.join(' ')


  end



end
