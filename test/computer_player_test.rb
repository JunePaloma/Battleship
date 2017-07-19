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
    assert_instance_of Fixnum, @cp.pick_index_for_first_little_ship_coordinate
  end

  def test_it_translates_index_into_coordinate
    refute_nil @cp.generate_first_little_ship_coordinate
  end

  # def test_it_can_pick_a_second_coordinate
  #   @cp.generate_first_coordinate
  #   refute_nil @cp.generate_second_little_ship_coordinate
  # end

  def test_it_can_pick_two_coordinates

    assert_equal ", ", @cp.create_little_ship_coordinates
  end

  def test_it_can_pick_three_coordinates

    assert_equal " , ", @cp.create_big_ship_coordinates
  end

  def test_it_can_pick_shot_location
  
    refute_nil @cp.fire_shot
  end

end
