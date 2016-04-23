class Map

  def initialize(width, height)
    @width = width
    @height = height
  end

  def reachable?(target_x, target_y)
    within_width?(target_x) && within_height?(target_y)
  end

  private

  def within_width?(target_x)
    target_x > 0 && target_x <= @width
  end

  def within_height?(target_y)
    target_y > 0 && target_y <= @height
  end

end