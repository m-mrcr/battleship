class Board

  def cells
    cells = Hash.new
    ("A".."D").each do |letter|
      (1..4).each do |number|
        coordinate = "#{letter}#{number}"
        cells[coordinate] = Cell.new(coordinate)
    end
  end
  cells
  end
end
