class Map

  DIRECTIONS = {N: {x:  0, y:   1},
                E: {x:  1, y:   0},
                S: {x:  0, y: - 1},
                W: {x: -1, y:   0}}.freeze

  def initialize(width: , height:)
    @width = width
    @height = height
  end

  def movement_is_possible?(x, y)
    within_width?(x) && within_height?(y)
  end

  def target_coordinates(x, y, direction)
    x = x + DIRECTIONS[direction][:x]
    y = y + DIRECTIONS[direction][:y]
    raise "Coordinates lead outside of map limits" unless movement_is_possible?(x, y)
    {x: x, y: y}
  end

  private

  def within_width?(x)
    x >= 0 && x <= @width
  end

  def within_height?(y)
    y >= 0 && y <= @height
  end
end