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
    assert_equal ["A1", "A2"], @board.occupied
  end

  def test_place_little_ship
    skip
    @board.human_places_little_ship("A1", "A2")
    assert_equal [little_ship], @board.placed_ships
  end

  def test_place_big_ship
    skip
    @board.human_places_big_ship("A1", "A2", "A3")
    assert_equal [big_ship], @board.placed_ships
  end

  def test_coordinates_consecutive
skip
  end

end
