class Plateau

  def initialize(x, y)
    @map = Array.new(y) {Array.new(x,:O)}
  end

  def map
    @map.dup
  end

  def add_to_map(x, y)
    @map[y][x] = :X
  end

  def update_map(x, y)

  end
end