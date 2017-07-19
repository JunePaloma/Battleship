gem 'minitest'
require './lib/computer_player'
require './lib/opponent_map'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class OpponentMapTest < Minitest::Test
  def setup
      @map = OpponentMap.new
  end

def test_board_exists
  assert_instance_of OpponentMap, @map
end

def test_board_is_empty
  assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], @map.make_array_of_all_spaces
end

end
