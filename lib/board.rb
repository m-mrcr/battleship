class Board

  def cells
    cells = Hash.new
    letter_coordinates = ("A".."D").to_a
    number_coordinates = (1..4).to_a

      letter_coordinates.each do |letter|

        number_coordinates.each do |number|
          coordinate = "#{letter}#{number}"
          cells[coordinate] = Cell.new(coordinate)
        end
      end
  cells
  end
end
