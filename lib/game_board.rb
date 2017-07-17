require './lib/three_unit_ship'
require './lib/two_unit_ship'
class GameBoard
  attr_accessor :boardhash,
                :placed_ships


  def initialize
    @boardhash = {"A1"=>"Open", "A2"=>"Open", "A3"=>"Open", "A4"=>"Open",
      "B1"=>"Open", "B2"=>"Open", "B3"=>"Open", "B4"=>"Open",
      "C1"=>"Open", "C2"=>"Open", "C3"=>"Open", "C4"=>"Open",
      "D1"=>"Open", "D2"=>"Open", "D3"=>"Open","D4"=>"Open"}
    @placed_ships = []
    @empty = []
  end

# to reassign value: boardhash[key] = "Occupied"

  def make_array_of_empty_spaces
    boardhash.keys.each do |coordinate|
      if boardhash[coordinate] == "Open"
        @empty << coordinate
      end
    end
  end


  def place_little_ship(coordinate1, coordinate2)
    empty.find do |coordinate|
      if coordinate1 == coordinate
      boardhash[coordinate1] = "Occupied"
      elsif coordinate2 == coordinate
        boardhash[coordinate2] = "Occupied"
      end
    end
    validate(coordinate1, coordinate2)
end

def validate(coordinate1, coordinate2, coordinate3 = nil)
  #array of empy spaces should now be missing the occupied spaces
end
      #   if valid?
      #   little_ship = TwoUnitShip.New(coordinate1, coordinate2)
      #   placed_ships << little_ship
      #   print "Your ship has been placed."
      # else
      #   print "One or more of those spaces is already occupied; please enter new coordinates."
      #

  def human_places_big_ship(coordinate1, coordinate2, coordinate3)
    empty.find do |coordinate|
      if coordinate1 == coordinate
        boardhash[coordinate1] = "Occupied"
      elsif coordinate2 == coordinate
        boardhash[coordinate2] = "Occupied"
      elsif coordinate3 == coordinate
        boardhash[coordinate3] = "Occupied"
        big_ship = ThreeUnitShip.New(coordinate1, coordinate2, coordinate3)
        placed_ships << little_ship
        print "Your ship has been placed."
      else
        print "You've already placed a ship in one or more of those spaces; please enter new coordinates."
      end
    end
  end



  def fire_at_ship(coordinate)
  hit.two_unit_ship(coordinate)
  hit.three_unit_ship(coordinate)
  end

end
