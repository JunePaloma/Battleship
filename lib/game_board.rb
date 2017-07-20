require './lib/three_unit_ship'
require './lib/two_unit_ship'

class GameBoard
  attr_accessor :boardhash,
                :empty,
                :ship_array

  def initialize
    @boardhash = {"A1"=>"Open", "A2"=>"Open", "A3"=>"Open", "A4"=>"Open",
      "B1"=>"Open", "B2"=>"Open", "B3"=>"Open", "B4"=>"Open",
      "C1"=>"Open", "C2"=>"Open", "C3"=>"Open", "C4"=>"Open",
      "D1"=>"Open", "D2"=>"Open", "D3"=>"Open","D4"=>"Open"}
    @empty = []
    @ship_array = []

  end

# to reassign value: boardhash[key] = "Occupied"

def make_little_ship(coordinate1, coordinate2)
  if valid_little_ship_coordinates?(coordinate1, coordinate2) == true
    place_little_ship(coordinate1, coordinate2)
    little_ship = TwoUnitShip.new(coordinate1, coordinate2)
  end
end

def place_little_ship(coordinate1, coordinate2)
      @boardhash[coordinate1] = "Occupied"
      @boardhash[coordinate2] = "Occupied"
      @ship_array << coordinate1
      @ship_array << coordinate2
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
  if board.index(coordinate1) == 3 || board.index(coordinate1) == 7 ||board.index(coordinate1) == 15 || board.index(coordinate1) == 11
    return true
  else
    return false
  end
end

def little_ship_vertical_valid?(coordinate1, coordinate2)
  board = make_array_of_all_spaces
  if board.index(coordinate2) - board.index(coordinate1) == 4
    return true
  else
    return false
  end
end

def make_big_ship(coordinate1, coordinate2, coordinate3)
  validity = valid_big_ship_coordinates?(coordinate1, coordinate2, coordinate3)
  if validity == true && will_ship_fit?(coordinate1, coordinate2, coordinate3) == true
  big_ship = ThreeUnitShip.new(coordinate1, coordinate2, coordinate3)
  end
end

def place_big_ship(coordinate1, coordinate2, coordinate3)
        @boardhash[coordinate1] = "Occupied"
        @boardhash[coordinate2] = "Occupied"
        @boardhash [coordinate3] = "Occupied"
        @ship_array << coordinate1
        @ship_array << coordinate2
        @ship_array << coordinate3
end

def valid_big_ship_coordinates?(coordinate1, coordinate2, coordinate3)
  if big_ship_vertical_valid?(coordinate1, coordinate2, coordinate3) == true
    return true
  elsif big_ship_continuous?(coordinate1, coordinate2, coordinate3) == true && big_ship_runs_off_board?(coordinate1) == false
    return true
  else
    return false
  end
end

def will_ship_fit?(coordinate1, coordinate2, coordinate3)
  if find_overlapping_spaces(coordinate1, coordinate2, coordinate3) == []
return true
  else
    #print "The following coordinates are already occupied {#{check_if_big_ship_fits}}. Choose again."
    return false
  end
end

  def find_overlapping_spaces(coordinate1, coordinate2, coordinate3)
    make_array_of_occupied_spaces.find_all do |coordinate|
      coordinate == coordinate1 || coordinate == coordinate2 || coordinate == coordinate3
      end
    end

def big_ship_vertical_valid?(coordinate1, coordinate2, coordinate3)
  board = make_array_of_all_spaces
  if board.index(coordinate3) - board.index(coordinate1) == 8
    return true
  else
    return false
  end
end

def big_ship_continuous?(coordinate1, coordinate2, coordinate3)
  board = make_array_of_all_spaces
  if board.index(coordinate2) - board.index(coordinate1) != 1
    return false
  elsif board.index(coordinate3) - board.index(coordinate2) != 1
    return false
  else
    return true
  end
end

def big_ship_runs_off_board?(coordinate1)
board = make_array_of_all_spaces
if board.index(coordinate1) == 2 || board.index(coordinate1) == 6 || board.index(coordinate1) == 10 || board.index(coordinate1) == 15
  return true
else
  return false
end
end


def make_array_of_all_spaces
  board_array = []
  @boardhash.keys.each do |coordinate|
    board_array << coordinate
    end
  board_array
end


def make_array_of_empty_spaces

  @boardhash.keys.each do |coordinate|
    if boardhash[coordinate] == "Open"
      @empty << coordinate
    end
  end
  @empty
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

end
