gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/two_unit_ship'
require './lib/three_unit_ship'
require './lib/computer_player'
require './lib/game_board'
require './lib/opponent_map'
require 'pry'

def set_up
  @player = Player.new
end
def test_it_exists

  assert_instance_of Player, @player
end
