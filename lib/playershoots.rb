require 'pry'
module PlayerShoots

  def shoot_at_little_ship(player_shot, computer, player)
    shot = player_shot
    # computer.compboard.little_ship_array.each do |ship_coordinate|
      if shot == computer.first_coordinate_ls
        puts "You landed a shot!"
        computer.little_ship.hits+=1
      elsif
         shot == computer.second_coordinate_ls
            puts "You landed a shot!"
         computer.little_ship.hits+=1
       else
         puts "Your shot missed; it's the computer's turn."
        end
      end
    end

    def shoot_at_big_ship(player_shot, computer, player)
      shot = player_shot
      # computer.compboard.big_ship_array.each do |ship_coordinate|
      if shot == computer.first_coodinate_bs
          puts "You landed a shot!"
          @computer.big_ship.hits+=1
      elsif shot == computer.second_coodinate_bs
          puts "You landed a shot!"
           @computer.big_ship.hits+=1
      elsif shot == computer.third_coordinate_bs
          puts "You landed a shot!"
        @computer.big_ship.hits+=1
      else
            puts "Your shot missed; it's the computer's turn."
      end
    end
      


end
