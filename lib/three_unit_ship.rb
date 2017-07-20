class ThreeUnitShip
  attr_accessor :coordinates

  def initialize(coordinate1, coordinate2, coordinate3)
    @coordinate1 = coordinate1
    @coordinate2 = coordinate2
    @coordinate3 = coordinate3
    @hit = 0
    @destroyed = false
  end


  def hit(coordinate)
    if coordinate == @coordinate1 ||coordinate == @coordinate3 ||coordinate == @coordinate2
    @hit+=1
    end
  end

  def destroyed?
    if @hit == 3
      @destroyed = true
      puts "Big ship destroyed!"
    end
  end

end
