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

end
