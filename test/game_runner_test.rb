gem 'minitest'
require './lib/game_board'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/two_unit_ship'
require './lib/three_unit_ship'
require './lib/game_runner'
require 'pry'

class GameRunnerTest < Minitest::Test
  def setup
    @game = GameRunner.new
  end

  def test_it_exists
    assert_instance_of GameRunner, @game
  end

  def test_computer_can_generate_small_ship_coordinates
    assert_equal [],@game.computer_places_small_ship
  end

end
