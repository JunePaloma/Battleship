require 'simplecov'
SimpleCov.start
gem 'minitest'
require './lib/two_unit_ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TwoUnitShipTest < Minitest::Test

    def test_it_exists
      little_ship = TwoUnitShip.new("B1", "C1")
      assert_instance_of TwoUnitShip, little_ship
    end


    def test_it_can_take_a_hit
      little_ship = TwoUnitShip.new("B1", "C1")
      little_ship.hit("B1")
      little_ship.hit("C1")


      assert_equal 2, little_ship.hits


    end

    def test_it_can_be_destroyed

      little_ship = TwoUnitShip.new("B1", "C1")

      little_ship.hit("B1")
      little_ship.hit("C1")

      assert_equal true, little_ship.destroyed
    end

  end
