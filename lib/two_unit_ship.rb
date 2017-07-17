class TwoUnitShip
  attr_accessor :coordinates

  def initialize(coordinate1, coordinate2)
    @coordinate1 = coordinate1
    @coordinate2 = coordinate2
    @hit = 0
    @destroyed = false
  end

def hit(coordinate)
  if coordinate == @coordinate1 ||coordinate == @coordinate2
    @hit+=1
    print "You hit the ship!"
  else
    print "You did not hit the ship."
  end
end

  def destroyed?
    if @hit == 2
      @destroyed = true
    end
  end

end
