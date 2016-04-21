class Rover

  DIRECTIONS = [:N, :W, :S, :E]

  def initialize(x, y, direction)
    @x_coordinate = x
    @y_coordinate = y
    @facing = direction
  end

  def coordinates
    "X:#{@x_coordinate}, Y: #{@y_coordinate}, facing: #{@facing}"
  end

  def turn_right
    @facing = turn("right")
  end

  def turn_left
    @facing = turn("left")
  end

  def forward(steps = 1)
    walk(steps)
  end

  private

  def turn(direction)
    index = DIRECTIONS.find_index(@facing)
    return DIRECTIONS[index + 1] if direction == "right"
    return DIRECTIONS[index - 1] if direction == "left"
  end

  def walk(steps)
    if @facing == :N
      @y_coordinate += steps
    elsif @facing == :S
      @y_coordinate -= steps
    elsif @facing == :W
      @x_coordinate += steps
    elsif @facing == :E
      @x_coordinate -= steps
    else
      "coordinates are invalid"
    end
  end
end