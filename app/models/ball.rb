class Ball < Engine::Model
  DEFAULT_SIZE = 10
  DEFAULT_SPEED = 9
  POSITION_Y = 25
  RANDOMNESS = 0.2

  def initialize
    @x = Viewport.xcenter
    @y = POSITION_Y
    @width = DEFAULT_SIZE
    @height = DEFAULT_SIZE
    @color = Colors.foreground

    @vertical_speed = DEFAULT_SPEED * angle_randomness_factor
    @horizontal_speed = starting_speed
  end

  def travel!
    travel_horizontally!
    travel_vertically!
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

  def bounce_horizontally
    @horizontal_speed = reverse(@horizontal_speed)
  end

  def bounce_vertically
    @vertical_speed = reverse(@vertical_speed)
  end

  private

  def travel_horizontally!
    @x += @horizontal_speed
    self
  end

  def travel_vertically!
    @y += @vertical_speed
    self
  end

  def reverse(speed)
    speed = speed > 0 ? -DEFAULT_SPEED : DEFAULT_SPEED
    speed * angle_randomness_factor
  end

  def intersect_with?(object)
    GTK::Geometry.intersect_rect?(rect, object.rect)
  end

  def angle_randomness_factor
    factor = rand * RANDOMNESS
    factor = -factor if factor > (RANDOMNESS / 2)
    1 + factor
  end

  def starting_speed
    rand * DEFAULT_SPEED * (rand > 0.5 ? 1 : -1)
  end
end
