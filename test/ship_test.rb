require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'

class ShipTest < MiniTest::Test
  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_it_has_a_name
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", cruiser.name
  end

  def test_that_cruiser_has_the_right_length
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.length
  end

  def test_that_cruiser_has_appropiate_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
  end

  def test_that_cruiser_begins_intact
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
  end

  def test_that_cruiser_can_be_hit
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    assert_equal 2, cruiser.health
  end

  def test_that_health_cannot_be_negative
    cruiser = Ship.new("Cruiser", 3)
    binding.pry
    cruiser.hit
    cruiser.hit
    cruiser.hit
    cruiser.hit
    assert_equal 0, cruiser.health
    assert_equal true, cruiser.sunk?

  end



end
