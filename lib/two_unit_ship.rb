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

def hit
    @hits+=1
end

  def destroyed?
    if @hit == 2
      @destroyed = true
    end
  end

end
