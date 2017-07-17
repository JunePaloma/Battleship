gem 'minitest'
require './lib/game_board'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameBoardTest < Minitest::Test
  def setup
      @board = GameBoard.new
    end

  def test_it_exists
    assert_instance_of GameBoard, @board
  end

  def test_board_is_empty
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], @board.make_array_of_empty_spaces
  end

  def test_board_spaces_can_be_occupied
    @board.place_little_ship("A1", "A2")
    assert_equal ["A1", "A2"], @board.make_array_of_occupied_spaces
  end

  # def test_board_spaces_that_are_occupied_cant_be_chosen
  #     @board.place_little_ship("A1", "A2")
  #     @board.place_little_ship("A1", "B1")
  #   assert_equal false, @board.place_little_ship("A1", "B1")
  # end

  def test_vertical_little_ship_placement_is_legal

      @board.place_little_ship("A1", "B1")
      assert_equal true, @board.little_ship_vertical_valid?("A1", "B1")

      @board.place_little_ship("A1", "A4")
      assert_equal false, @board.little_ship_vertical_valid?("A1", "A4")

      @board.place_little_ship("A1", "D4")
      assert_equal false, @board.little_ship_vertical_valid?("A1", "D4")

      @board.place_little_ship("A1", "B2")
      assert_equal false, @board.little_ship_vertical_valid?("A1", "B2")
  end

  # def test_support_for_horizontal_validation
  #   @board.place_little_ship("B1", "B2")
  #   assert_equal 1, @board.support_for_horizontal_validation
  # end


  def test_if_ship_is_continuous

    @board.place_little_ship("B1", "B4")
    assert_equal false, @board.little_ship_continuous?("B1", "B4")

    @board.place_little_ship("D1", "A1")
    assert_equal false, @board.little_ship_continuous?("D1", "A1")

    @board.place_little_ship("B4", "B1")
    assert_equal false, @board.little_ship_continuous?("B4", "B1")

    @board.place_little_ship("A2", "D4")
    assert_equal false, @board.little_ship_continuous?("A2", "D4")

    @board.place_little_ship("A2", "A3")
    assert_equal true, @board.little_ship_continuous?("A2", "A3")

  end

  def test_little_ship_runs_off_board?
    @board.place_little_ship("B4", "B1")
    assert_equal true, @board.little_ship_runs_off_board?("B4", "B1")

    @board.place_little_ship("A4", "B1")
    assert_equal true, @board.little_ship_runs_off_board?("A4", "B1")

    @board.place_little_ship("B1", "B2")
    assert_equal false, @board.little_ship_runs_off_board?("B1", "B2")

  end

  def test_little_ship_placement_is_valid

    @board.place_little_ship("A4", "B1")
    assert_equal false, @board.valid_little_ship_coordinates?("A4", "B1")

    @board.place_little_ship("B4", "B1")
    assert_equal false, @board.valid_little_ship_coordinates?("B4", "B1")

    @board.place_little_ship("A1", "B1")
    assert_equal true, @board.valid_little_ship_coordinates?("A1", "B1")

    @board.place_little_ship("D1", "A1")
    assert_equal false, @board.valid_little_ship_coordinates?("D1", "A1")

    @board.place_little_ship("C2", "D2")
    assert_equal true, @board.valid_little_ship_coordinates?("C2", "D2")

  end

  # def test_place_big_ship
  #   skip
  #   @board.human_places_big_ship("A1", "A2", "A3")
  #   assert_equal [big_ship], @board.placed_ships
  # end
  #
  # def test_coordinates_consecutive
  #   skip
  # end
end
