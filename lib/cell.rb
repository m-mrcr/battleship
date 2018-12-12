require './lib/ship'
class Cell

  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_at = false
    @status = "."
  end

def empty?
  if @ship == nil
    true
  else
    false
  end
end

def place_ship(ship)
  @ship = ship
end

def fired_upon?
  @fired_at
end

def fire_upon
  if !empty? && !fired_upon?
    @ship.hit
    @fired_at = true
  else
    @fired_at = true
  end
end

def render(show_ship = false)
  case
    when !empty?  && @ship.sunk?
      @status = 'X'
    when !empty? && fired_upon?
      @status = 'H'
    when empty? && fired_upon?
      @status = 'M'
    when !empty? && show_ship == true
      @status = 'S'
    else
      @status
  end
end

end
