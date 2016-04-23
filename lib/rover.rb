class Rover

  DIRECTIONS = [:N, :W, :S, :E]

  def initialize(x, y, direction, map: map)
    @coordinates = {x: x, y: y}
    @facing = direction
    @map = map
  end

  def coordinates
    "#{@coordinates[:x]} #{@coordinates[:y]} #{@facing}"
  end

  def move
    movement_is_possible?
    step_forward if movement_is_possible?
  end

  def turn(command)
    if command == :R
      turn_right
    else
      turn_left
    end
  end

private

  def turn_right
    index = DIRECTIONS.find_index(@facing)
    @facing = DIRECTIONS[index + 1]
  end

  def turn_left
    index = DIRECTIONS.find_index(@facing)
    @facing = DIRECTIONS[index - 1]
  end

  def movement_is_possible?
   target_coordinates
   @target_x ||= @coordinates[:x]
   @target_y ||= @coordinates[:y]
   @map.reachable?(@target_x, @target_y)
  end

  def target_coordinates
    case @facing
    when :N
      @target_y = @coordinates.dup[:y] += 1
    when :S
      @target_y = @coordinates.dup[:y] -= 1
    when :W
      @target_x = @coordinates.dup[:x] += 1
    else
      @target_x = @coordinates.dup[:x] -= 1
    end
  end

  def step_forward
    @coordinates[:y] = @target_y
    @coordinates[:x] = @target_x
  end
end