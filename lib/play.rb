
require './lib/game_runner'

puts "Welcome to BATTLESHIP"

user_is_silent = true

while user_is_silent
  puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  user_input = gets.chomp
  if user_input == "i"
    puts "Some instructions about playing battleship"
  elsif user_input == "q"
    puts "Goodbye"
    break
  elsif user_input == "p"
    user_is_silent = false
  else
    puts "I'm sorry that was not a valid command. Please try again."
  end
end

start_game = GameRunner.new.start_playing
