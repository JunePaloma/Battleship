gem 'minitest'
require './lib/game_board'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/two_unit_ship'
require './lib/three_unit_ship'
require './lib/computer_player'
require 'pry'

class ComputerPlayerTest < Minitest::Test

  def setup
    @cp = ComputerPlayer.new
  end

  def test_it_exists
    assert_instance_of ComputerPlayer, @cp
  end

  def test_it_has_a_game_board
    assert_instance_of GameBoard, @cp.compboard
  end

  def test_it_can_pick_first_index
    assert_instance_of Fixnum, @cp.pick_index_for_first_coordinate
  end

  def test_it_translates_index_into_coordinate
    refute_nil @cp.get_coordinate_for_first_space
  end

  def test_it_can_pick_two_coordinates
    skip
    assert_equal ["A1", "A2"], @cp.pick_two_coordinates
  end

end
