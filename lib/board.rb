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
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length
      true
    else
      false
    end
  end

  def 

end
