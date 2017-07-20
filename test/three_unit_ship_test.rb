require 'simplecov'
SimpleCov.start
gem 'minitest'
require './lib/three_unit_ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


  class ThreeUnitShipTest < Minitest::Test

      def test_it_exists
      big_ship = ThreeUnitShip.new("B1", "C1", "D1")
        assert_instance_of big_ship, ThreeUnitShip.new("B1", "C1", "D1")
      end

      def test_it_can_take_a_hit
        big_ship = ThreeUnitShip.new("B1", "C1", "D1")
        big_ship.hit("B1")
        big_ship.hit("C1")
        big_ship.hit("D1")

        assert_equal 3, big_ship.hits

      end

      def test_it_can_be_destroyed
        big_ship = ThreeUnitShip.new("B1", "C1", "D1")

        big_ship.hit("B1")
        big_ship.hit("C1")
        big_ship.hit("D1")

        assert_equal true, big_ship.ship_destroyed
      end

  end
