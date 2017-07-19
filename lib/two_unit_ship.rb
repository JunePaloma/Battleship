class TwoUnitShip
  attr_accessor :coordinates

  def initialize(coordinate1, coordinate2)
    @coordinate1 = coordinate1
    @coordinate2 = coordinate2
    @hit = 0
    @destroyed = false
  end

def hit
    @hit+=1
end

  def destroyed?
    if @hit == 2
      @destroyed = true
    end
  end

end
