gem 'minitest'
require './lib/three_unit_ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ThreeUnitShipTest < Minitest::Test

  class TwoUnitShipTest < Minitest::Test

      def test_it_exists
      big_ship = ThreeUnitShip.New("B1", "C1", "D1")
        assert_instance_of little_ship, ThreeUnitShip.New("B1", "C1", "D1")
      end

      def test_coordinates_consecutive
      end

      def test_it_can_take_a_hit
      end

    end
