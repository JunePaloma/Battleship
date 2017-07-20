require 'pry'
class TwoUnitShip
  attr_accessor :coordinate1,
                :coordinate2,
                :hits,
                :destroyed

  def initialize(coordinate1, coordinate2)
    @coordinate1 = coordinate1
    @coordinate2 = coordinate2
    @hits = 0
    @destroyed = false
  end

def hit(coordinate)
  if coordinate == @coordinate1 || coordinate == @coordinate2
    @hits+=1
  ship_destroyed
  end
end

  def ship_destroyed
    if @hit == 2
      puts "Little ship destroyed!"
      @destroyed = true
    end
  end

end
