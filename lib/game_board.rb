class GameBoard
  attr_accessor :boardhash

  def initialize
    @boardhash = {"A1"=>"Open", "A2"=>"Open", "A3"=>"Open", "A4"=>"Open",
      "B1"=>"Open", "B2"=>"Open", "B3"=>"Open", "B4"=>"Open",
      "C1"=>"Open", "C2"=>"Open", "C3"=>"Open", "C4"=>"Open",
      "D1"=>"Open", "D2"=>"Open", "D3"=>"Open","D4"=>"Open"}
  end

# to reassign value: boardhash[key] = "Occupied"

  def empty?
    boardhash.keys.each do |key|
        if boardhash[key] == "Open"
        true
        end
    end
  end

  def place_ship(coordinate1, coordinate2) #need the player class to be able to change this.
    if boardhash[coordinate1] == "Open" && boardhash[coordinate2] == "Open"
     boardhash[coordinate1] = "Occupied"
     boardhash[coordinate2] = "Occupied"
     print "Your ship has been placed"

    elsif boardhash[corrdinate1] == "Occupied" && boardhash[coordinate2] == "Occupied"
    print "The first coordinate is occupied, please choose a differnt one."

    elsif boardhash[coordinate1] == "Open" && boardhash[coordinate2] == "Occupied"
    print "The second coordinate is occupied, please choose a differnt one."

    else
    print "The coordinates are occpied, please choose again"
    end
  end

def hit_ship(coordinate)
  if boardhash[coordinate] == "Occupied"
   boardhash[coordinate] = "Hit"
   print "You hit the ship!"
  else
  print "You did not hit the ship."
  end
end

end
