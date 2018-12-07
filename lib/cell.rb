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

  def render(show_ship = false)
    if show_ship == false
      if fired_upon? == true
        if @ship != nil && @ship.health != 0
          @status = 'H'
        elsif @ship != nil && @ship.health == 0
          @status = 'X'
        else
          @status = "M"
        end
      elsif fired_upon? == false
        @status
      end
  else
    if fired_upon? == true
      if @ship != nil && @ship.health != 0
        @status = 'H'
      elsif @ship != nil && @ship.health == 0
        @status = 'X'
      else
        @status = "M"
      end
    elsif fired_upon? == false
      @status = "S"
    end
    end
    @status
  end

end
