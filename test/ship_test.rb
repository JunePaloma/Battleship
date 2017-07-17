gem 'minitest'
require './lib/game_board'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/two_unit_ship'
require './lib/ships'
require 'pry'

class ShipTest < Minitest::Test
  def setup
      @two_horizontal = Ships.new("A1", "A2")
      @three_horizontal = Ships.new("A1", "A2", "A3")

    end
  def test_it_exists
    assert_instance_of Ships, @two_horizontal
  end

end
