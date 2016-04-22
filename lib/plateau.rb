class Plateau

  def initialize(x, y)
    @map = Array.new(y) {Array.new(x,:O)}
  end

  def map
    @map.dup
  end
end