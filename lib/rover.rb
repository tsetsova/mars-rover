class Rover

  DIRECTIONS = [:N, :E, :S, :W]

  def initialize(x, y, direction)
    @x_coordinate = x
    @y_coordinate = y
    @direction = direction
  end

  def coordinates
    "X:#{@x_coordinate}, Y: #{@y_coordinate}, facing: #{@direction}"
  end
end