class Ball < Engine::Model
  DEFAULT_SIZE = 10
  DEFAULT_SPEED = 10
  POSITION_Y = 25

  def initialize
    @x = Viewport.xcenter(DEFAULT_SIZE)
    @y = POSITION_Y
    @width = DEFAULT_SIZE
    @height = DEFAULT_SIZE
    @color = ColorPalette.foreground

    @vertical_speed = DEFAULT_SPEED
    @horizontal_speed = DEFAULT_SPEED
  end

  def tick
    travel!
  end

  def render
    $args.outputs.solids << [x, y, width, height, *color]
  end

  def bounce_off(object)
    bounce_horizontally if self.clone.travel_horizontally!.intersect_with?(object)
    bounce_vertically if self.clone.travel_vertically!.intersect_with?(object)
  end

  def next_ball
    self.clone.travel!
  end

  private

  def bounce_horizontally
    @horizontal_speed = -@horizontal_speed
  end

  def bounce_vertically
    @vertical_speed = -@vertical_speed
  end

  def travel!
    travel_horizontally!
    travel_vertically!
  end

  def travel_horizontally!
    @x += @horizontal_speed
    self
  end

  def travel_vertically!
    @y += @vertical_speed
    self
  end

  def intersect_with?(object)
    GTK::Geometry.intersect_rect?(rect, object.rect)
  end
end
