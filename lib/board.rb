class Board

  attr_reader :cells,
              :letter_coordinates,
              :number_coordinates

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





  end


  def valid_placement?(ship, coordinates)
    if ship.length != coordinates.length
      return false
    end


      #return falase

    # orientation = get_orientation(coordinates)
    #
    # if orientation == :horizontal
    #
    # elsif orientation == :vertical
    #
    # else
    #   return false
    # end







  end

end
