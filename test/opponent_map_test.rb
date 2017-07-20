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

def test_board_is_clear
  assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], @map.make_array_of_unfired_spaces
end

def test_mark_hits
  assert_equal "Fired", @map.mark_hits("A3")
end

def test_play_map_access_works
  asser_equal [], @map.find_out_if_shot_hit("B2")
end

end
