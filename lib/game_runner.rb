require './lib/computer_player'
require './lib/game_board'
require './lib/player'

class GameRunner
  attr_accessor :computer,
              :player

  def intialize
    @computer = ComputerPlayer.new
    @player = Player.new
    @display = ?
  end



  def computer_places_little_ship
    @computer
  end

  def computer_places_big_ship
  end

  def player_places_little_ship
  end

  def player_places_big_ship
  end

  def player_shoots_at_computer
  end

  def check_if_player_shot_landed
  end

  def computer_shoots_at_player
    shot = @computer.pick_shot
    @computer.fire_shot
    shot
  end
#
# def check_whether_computer_shot_landed
#     shot = computer_shoots_at_player
#     @player.little_ship_array.each do |ship_coordinate|
#       if shot == ship_coordinate
#     @player.littl_ship_array.each do |ship_coordinate|
#           if shot == ship_coordinate
#         end
#       end
#     end
#   end

end
