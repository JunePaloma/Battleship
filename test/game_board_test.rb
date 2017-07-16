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
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], @board.empty?
  end

  def test_place_little_ship
    assert_equal , @board.place_ship("A1", "A2")
  end

end
