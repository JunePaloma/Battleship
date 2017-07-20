require 'simplecov'
SimpleCov.start
gem 'minitest'
require './lib/two_unit_ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TwoUnitShipTest < Minitest::Test

    def test_it_exists
      little_ship = TwoUnitShip.New("B1", "C1")
      assert_instance_of little_ship, TwoUnitShip.New("B1", "C1")
    end



    def test_it_can_take_a_hit
    end

    def test_it_can_be_destroyed
    end

  end
