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

def test_it_can_generate_second_coordinate
  @cp.first_coordinate_ls = "A1"
  @cp.generate_second_little_ship_coordinate
  assert_equal "A2", @cp.second_coordinate_ls

  @cp.first_coordinate_ls = "A2"
  @cp.ls_starting_index = 1
  @cp.generate_second_little_ship_coordinate
  assert_equal "A3", @cp.second_coordinate_ls


  @cp.first_coordinate_ls = "A3"
  @cp.ls_starting_index = 2
  @cp.generate_second_little_ship_coordinate
  assert_equal "A4", @cp.second_coordinate_ls


  @cp.ls_starting_index = 3
  @cp.first_coordinate_ls = "A4"
  @cp.generate_second_little_ship_coordinate
  assert_equal "B4", @cp.second_coordinate_ls
end

  # def test_it_can_pick_two_coordinates
  #
  #   assert_equal ", ", @cp.create_little_ship_coordinates
  # end
  #
  # def test_it_can_pick_three_coordinates
  #
  #   assert_equal " , ", @cp.create_big_ship_coordinates
  # end

  def test_it_can_pick_shot_location
skip
    refute_nil @cp.pick_shot
  end

  def test_little_ship_is_on_board
skip
    @cp.place_little_ship
    assert_instance_of TwoUnitShip, @little_ship
  end

end
