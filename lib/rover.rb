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
    step_forward if movement_is_possible?
  end

  def turn(command)
    @facing = DIRECTIONS[determine_direction(command)]
  end

private

  def determine_direction(command)
    index = DIRECTIONS.find_index(@facing)
    return index + 1 if command == :R
    return index - 1 if command == :L
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