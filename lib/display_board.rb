require './lib/game_runner'
require 'pry'
class DisplayBoard

def initialize(player)
  @board = player.playerboard.boardhash
end
  def draw_board
        ('A'..'D').each do |letter|
            (1..4).each do |i|
                @board["#{letter}#{i}"] = "*"
                  print @board["#{letter}#{i}"]
              end
              puts
          end
  end

  # def display
  #   puts "  1 2 3 4"
  #   4.times do
  #     puts "_________"
  #   end
  # end

end
