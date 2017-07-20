class ThreeUnitShip
  attr_accessor :coordinates,
                :destroyed,
                :hits

  def initialize(coordinate1, coordinate2, coordinate3)
    @coordinate1 = coordinate1
    @coordinate2 = coordinate2
    @coordinate3 = coordinate3
    @hits = 0
    @destroyed = false
  end


  def hit(coordinate)
    if coordinate == @coordinate1 ||coordinate == @coordinate3 ||coordinate == @coordinate2
    @hits+=1
    ship_destroyed
    end
  end

  def ship_destroyed
    if @hits == 3
      @destroyed = true
      puts "Big ship destroyed!"
    end
  end

end
