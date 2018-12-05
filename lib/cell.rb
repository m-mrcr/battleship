require './lib/ship'
class Cell

  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
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
  @fired_upon
end

def fire_upon
  @fired_upon = true
  if empty? == false
    @ship.hit
  end
end

def render
  @status
end

end
