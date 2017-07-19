gem 'minitest'
require './lib/game_board'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/two_unit_ship'
require './lib/three_unit_ship'
require 'pry'

class GameBoardTest < Minitest::Test
  def setup
      @new_board = GameBoard.new
    end

  def test_it_exists
    assert_instance_of GameBoard, @new_board
  end

  def test_board_is_empty
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], @new_board.make_array_of_empty_spaces
  end

  def test_board_spaces_can_be_occupied
    @new_board.place_little_ship("A1", "A2")
    assert_equal ["A1", "A2"], @new_board.make_array_of_occupied_spaces
  end

  def test_vertical_little_ship_placement_is_legal

      @new_board.place_little_ship("A1", "B1")
      assert_equal true, @new_board.little_ship_vertical_valid?("A1", "B1")

      @new_board.place_little_ship("A1", "A4")
      assert_equal false, @new_board.little_ship_vertical_valid?("A1", "A4")

      @new_board.place_little_ship("A1", "D4")
      assert_equal false, @new_board.little_ship_vertical_valid?("A1", "D4")

      @new_board.place_little_ship("A1", "B2")
      assert_equal false, @new_board.little_ship_vertical_valid?("A1", "B2")
  end


  def test_if_ship_is_continuous

    @new_board.place_little_ship("B1", "B4")
    assert_equal false, @new_board.little_ship_continuous?("B1", "B4")

    @new_board.place_little_ship("D1", "A1")
    assert_equal false, @new_board.little_ship_continuous?("D1", "A1")

    @new_board.place_little_ship("B4", "B1")
    assert_equal false, @new_board.little_ship_continuous?("B4", "B1")

    @new_board.place_little_ship("A2", "D4")
    assert_equal false, @new_board.little_ship_continuous?("A2", "D4")

    @new_board.place_little_ship("A2", "A3")
    assert_equal true, @new_board.little_ship_continuous?("A2", "A3")

  end

  def test_little_ship_runs_off_board?
    @new_board.place_little_ship("B4", "B1")
    assert_equal true, @new_board.little_ship_runs_off_board?("B4", "B1")

    @new_board.place_little_ship("A4", "B1")
    assert_equal true, @new_board.little_ship_runs_off_board?("A4", "B1")

    @new_board.place_little_ship("B1", "B2")
    assert_equal false, @new_board.little_ship_runs_off_board?("B1", "B2")

  end

  def test_little_ship_placement_is_valid

    @new_board.place_little_ship("A4", "B1")
    assert_equal false, @new_board.valid_little_ship_coordinates?("A4", "B1")

    @new_board.place_little_ship("B4", "B1")
    assert_equal false, @new_board.valid_little_ship_coordinates?("B4", "B1")

    @new_board.place_little_ship("A1", "B1")
    assert_equal true, @new_board.valid_little_ship_coordinates?("A1", "B1")

    @new_board.place_little_ship("D1", "A1")
    assert_equal false, @new_board.valid_little_ship_coordinates?("D1", "A1")

    @new_board.place_little_ship("C2", "D2")
    assert_equal true, @new_board.valid_little_ship_coordinates?("C2", "D2")

    @new_board.place_little_ship("D2", "D3")
    assert_equal true, @new_board.valid_little_ship_coordinates?("D2", "D3")

  end


  def test_a_little_ship_is_made
  assert_instance_of TwoUnitShip, @new_board.make_little_ship("D2", "D3")
  end

  def test_if_big_ship_fits
  
    @new_board.place_little_ship("D2", "D3")
    assert_equal [], @new_board.find_overlapping_spaces("A1", "A2", "A3")
    assert_equal ["D2", "D3"], @new_board.find_overlapping_spaces("D1", "D2", "D3")
  end

  def test_if_ship_fits

    @new_board.place_little_ship("D2", "D3")
    assert_equal true, @new_board.will_ship_fit?("A1", "A2", "A3")

    @new_board.place_little_ship("D2", "D3")
    assert_equal false, @new_board.will_ship_fit?("D1", "D2", "D3")
  end

def test_is_big_ship_vertical_valid
  assert_equal true, @new_board.big_ship_vertical_valid?("A1", "B1", "C1")
  assert_equal false, @new_board.big_ship_vertical_valid?("A1", "C1", "D1")
  assert_equal false, @new_board.big_ship_vertical_valid?("C1", "C3", "D1")
end

def test_is_big_ship_continuous
  assert_equal true, @new_board.big_ship_continuous?("A1", "A2", "A3")
  assert_equal false, @new_board.big_ship_continuous?("A1", "A3", "A4")
  assert_equal false, @new_board.big_ship_continuous?("A1", "B3", "A3")
  assert_equal false, @new_board.big_ship_continuous?("B1", "B3", "A3")
  assert_equal false, @new_board.big_ship_continuous?("B2", "B3", "B1")
  assert_equal false, @new_board.big_ship_continuous?("B1", "B2", "B4")
end

def test_big_ship_runs_off_board
  assert_equal false, @new_board.big_ship_runs_off_board?("A1")
  assert_equal true, @new_board.big_ship_runs_off_board?("A3")
end

def test_big_ship_coordinates_validity
  assert_equal true, @new_board.valid_big_ship_coordinates?("A1", "A2", "A3")
  assert_equal true, @new_board.valid_big_ship_coordinates?("A1", "B1", "C1")
  assert_equal false, @new_board.valid_big_ship_coordinates?("A1", "B1", "D1") #not continuous vertical
  assert_equal false, @new_board.valid_big_ship_coordinates?("A1", "A2", "A4") #not continuous horizontal
  assert_equal false, @new_board.valid_big_ship_coordinates?("A1", "B1", "C3") #diagonal
  assert_equal false, @new_board.valid_big_ship_coordinates?("B3", "B4", "B1") #wrap around board
end

def test_a_big_ship_is_made
assert_instance_of ThreeUnitShip, @new_board.make_big_ship("D1","D2","D3")
refute_instance_of ThreeUnitShip, @new_board.make_big_ship("D1","D2","D4")
end

def test_board_array
  assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], @new_board.board_array
end

end
