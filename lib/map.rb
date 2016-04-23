class Map

  def initialize(width, height)
    @width = width
    @height = height
  end


  def movement_is_possible?(x, y)
    within_width?(x) && within_height?(y)
  end

  private

  def within_width?(x)
    x > 0 && x <= @width
  end

  def within_height?(y)
    y > 0 && y <= @height
  end

end