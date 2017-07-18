require './lib/three_unit_ship'
require './lib/two_unit_ship'
require './lib/ships'
class GameBoard
  attr_accessor :boardhash,
                :occupied


  def initialize
    @boardhash = {"A1"=>"Open", "A2"=>"Open", "A3"=>"Open", "A4"=>"Open",
      "B1"=>"Open", "B2"=>"Open", "B3"=>"Open", "B4"=>"Open",
      "C1"=>"Open", "C2"=>"Open", "C3"=>"Open", "C4"=>"Open",
      "D1"=>"Open", "D2"=>"Open", "D3"=>"Open","D4"=>"Open"}
  end

# to reassign value: boardhash[key] = "Occupied"


def place_little_ship(coordinate1, coordinate2)
  get_empties = make_array_of_empty_spaces
  get_empties.each do |coordinate|
    if coordinate1 == coordinate
      @boardhash[coordinate1] = "Occupied"
    elsif coordinate2 == coordinate
      @boardhash[coordinate2] = "Occupied"
    end
  end
end #no return, this just changes the values of the keys in the hash

  def make_array_of_all_spaces
    board_array = []
    @boardhash.keys.each do |coordinate|
      board_array << coordinate
      end
    board_array
  end

  def make_array_of_empty_spaces
    empty = []
    @boardhash.keys.each do |coordinate|
      if boardhash[coordinate] == "Open"
        empty << coordinate
      end
    end
    empty
  end

  def make_array_of_occupied_spaces
    occupied = []
    @boardhash.keys.each do |coordinate|
      if boardhash[coordinate] == "Occupied"
        occupied << coordinate
      end
    end
    occupied
  end


  def little_ship_vertical_valid?(coordinate1, coordinate2)
    board = make_array_of_all_spaces
    if board.index(coordinate2) - board.index(coordinate1) == 4
      return true
    else
      return false
    end
  end


  def little_ship_continuous?(coordinate1, coordinate2)
    board = make_array_of_all_spaces
    if board.index(coordinate2) - board.index(coordinate1) != 1
      return false
    else
      return true
    end
  end



  def little_ship_runs_off_board?(coordinate1, coordinate2)
    board = make_array_of_all_spaces
    if board.index(coordinate1) == 3 || board.index(coordinate1) == 7 ||board.index(coordinate1) == 15
      return true
    else
      return false
    end
  end

  def valid_little_ship_coordinates?(coordinate1, coordinate2)
    continuous = little_ship_continuous?(coordinate1, coordinate2)
    off_board = little_ship_runs_off_board?(coordinate1, coordinate2)
    vertical = little_ship_vertical_valid?(coordinate1, coordinate2)
    if continuous == true && off_board == false
      return true
    elsif vertical == true
      return true
    else
      return false
    end
  end

def make_little_ship(coordinate1, coordinate2)
  validity = valid_little_ship_coordinates?(coordinate1, coordinate2)
  if validity == true
    little_ship = TwoUnitShip.new(coordinate1, coordinate2)
  end
end


  def check_if_big_ship_fits(coordinate1, coordinate2, coordinate3)
    make_array_of_occupied_spaces.find_all do |coordinate|
      coordinate == coordinate1 || coordinate == coordinate2 || coordinate == coordinate3
      end
    end

    def will_ship_fit?(coordinate1, coordinate2, coordinate3)
      if check_if_big_ship_fits(coordinate1, coordinate2, coordinate3) == []
        return true
      else
        return false  
      end
    end

      # coordinate1 == coordinate && @boardhash[coordinate1] == "Occupied"
      #     return_string = "The first coordinate is occupied, choose again."
      #   elsif coordinate2 == coordinate && @boardhash[coordinate2] == "Occupied"
      #     return_string = "The second coordinate is occupied, choose again."
      #   elsif coordinate3 == coordinate && @boardhash[coordinate3] == "Occupied"
      #     return_string = "The third coordinate is occupied, choose again."
    #     else
    #       #place_big_ship(coordinate1, coordinate2, coordinate3)
    #     end
    #   end
    #
    # end

  def place_big_ship(coordinate1, coordinate2, coordinate3)
  end

end

#if both vertical and horizontal are valid, create the ship object.





      #   if valid?
      #   little_ship = TwoUnitShip.New(coordinate1, coordinate2)
      #   placed_ships << little_ship
      #   print "Your ship has been placed."
      # else
      #   print "One or more of those spaces is already occupied; please enter new coordinates."
      #

  # def human_places_big_ship(coordinate1, coordinate2, coordinate3)
  #   empty.find do |coordinate|
  #     if coordinate1 == coordinate
  #       boardhash[coordinate1] = "Occupied"
  #     elsif coordinate2 == coordinate
  #       boardhash[coordinate2] = "Occupied"
  #     elsif coordinate3 == coordinate
  #       boardhash[coordinate3] = "Occupied"
  #       big_ship = ThreeUnitShip.New(coordinate1, coordinate2, coordinate3)
  #       placed_ships << little_ship
  #       print "Your ship has been placed."
  #     else
  #       print "You've already placed a ship in one or more of those spaces; please enter new coordinates."
  #     end
  #   end
  # end



  # def fire_at_ship(coordinate)
  # hit.two_unit_ship(coordinate)
  # hit.three_unit_ship(coordinate)
  # end
