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
  if empty? == false && fired_upon? == false
    @ship.hit
    @fired_at = true
  else
    @fired_at = true
  end
end

def render(show_ship = false)
  case
    when empty? == false && @ship.sunk? == true
      @status = 'X'
    when empty? == false && fired_upon? == true
      @status = 'H'
    when empty? == true && fired_upon? == true
      @status = 'M'
    when empty? == false && show_ship == true
      @status = 'S'
    else
      @status
  end
end

end
