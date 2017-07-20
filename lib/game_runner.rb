require './lib/computer_player'
require './lib/game_board'
require './lib/player'
require 'pry'
require './lib/display_board'
require './lib/computer_shoots'
require './lib/player_shoots'

class GameRunner
  include DisplayBoard
  include PlayerShoots
  include ComputerShoots

  attr_accessor :computer,
                :player
                :gameover

  def initialize
    @computer = ComputerPlayer.new
    @player = Player.new
    @display = []
    @gameover = false
  end

  def start_playing
    @computer.place_little_ship
    @computer.place_big_ship
  puts "I have laid out my ships on the grid.
  You now need to layout your two ships.
  The first is two units long and the
  second is three units long.
  The grid has A1 at the top left and D4 at the bottom right.

  Enter the first coordinate for your two unit ship in the form 'A1'."

  player_little_ship_coordinate1 = gets.chomp

  puts "Enter the second coordinate for your two unit ship; it should comply with the rules!"

  player_little_ship_coordinate2 = gets.chomp
  @player.playerboard.make_little_ship(player_little_ship_coordinate1, player_little_ship_coordinate2)

  puts "Now enter the first coordinate of your three unit ship."

  player_big_ship_coordinate_1 = gets.chomp

  puts "Now enter the second coordinate of your three unit ship."

  player_big_ship_coordinate_2 = gets.chomp

  puts "Now enter the third coordinate of your three unit ship."

  player_big_ship_coordinate_3 = gets.chomp

  @player.playerboard.make_big_ship(player_big_ship_coordinate_1, player_big_ship_coordinate_2, player_big_ship_coordinate_3)

  draw_board(@player.playerboard.boardhash)
  puts "Your ships are at sea!"

  game_play
  end

  def game_play
    gameover = false
    while gameover == false
      binding.pry
      if @computer.little_ship.destroyed == true && @computer.big_ship.destroyed == true
        binding.pry

      puts "You won! Game over."
      gameover = true
    elsif  @player.little_ship.destroyed == true && @computer.big_ship.destroyed == true
      binding.pry
      puts "You Lost! Game over."
      else
      shooting_sequence
      end
    end
  end

def shooting_sequence

    puts "Please enter a coordinate to shoot at in the form 'A1'."
    player_shot = gets.chomp
    shoot_at_little_ship(player_shot, @computer, @player)
    shoot_at_big_ship(player_shot, @computer, @player)
    computer_shoots_at_player_little_ship(@computer, @player)
    computer_shoots_at_player_big_ship(@computer, @player)

end



end
