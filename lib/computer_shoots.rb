module ComputerShoots
  def computer_shoots_at_player(computer, player)
    shot = computer.pick_shot
    computer.fire_shot
    shot
  end


  def check_whether_computer_shot_landed(computer, player)
      shot = computer_shoots_at_player(computer, player)

       if shot == player.little_ship.coordinate1 || shot == player.little_ship.coordinate2
         player.little_ship.hits+=1
         puts "The computer hit your little ship!"

       elsif  shot == player.big_ship.coordinate1 || shot == player.big_ship.coordinate2 || shot == player.big_ship.coordinate3
         player.big_ship.hits+=1
         puts "The computer hit your big ship!"
       else
         puts "The computer did not hit your ships."
      end
    end






end
