class OpponentMap
  attr_accessor :board_array
                :boardhash
  def initialize
    @boardhash = {"A1"=>"Open", "A2"=>"Open", "A3"=>"Open", "A4"=>"Open",
      "B1"=>"Open", "B2"=>"Open", "B3"=>"Open", "B4"=>"Open",
      "C1"=>"Open", "C2"=>"Open", "C3"=>"Open", "C4"=>"Open",
      "D1"=>"Open", "D2"=>"Open", "D3"=>"Open","D4"=>"Open"}

    @available = []
  end

# def make_array_of_all_spaces
#   @boardhash.keys.each do |coordinate|
#     @board_array << coordinate
#     end
#   @board_array
# end

def make_array_of_unfired_spaces(coordinate = 0)
  @boardhash.keys.each do |coordinate|
    if @boardhash[coordinate] == "Open" #may need @boardhash
      @available << coordinate
    end
  end
  @available
end

def mark_hits(coordinate)
  @boardhash[coordinate] = "Fired"
end

end
