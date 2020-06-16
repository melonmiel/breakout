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
    move!
  end

  def render
    $args.outputs.solids << [x, y, width, height, *color]
  end

  def bounce_off(direction:)
    case direction
    when :vertical
      @vertical_speed = -@vertical_speed
    when :horizontal
      @horizontal_speed = -@horizontal_speed
    end
  end

  def next_move
    self.clone.move!
  end

  private

  def move!
    @x += @horizontal_speed
    @y += @vertical_speed
    self
  end
end
