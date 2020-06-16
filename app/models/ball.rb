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
    move
    collide
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
    next_self = self.clone
    next_self.move
    next_self
  end

  private

  def move
    @x += @horizontal_speed
    @y += @vertical_speed
  end

  def collide
    bounce_off(direction: :horizontal) if collide_horizontally
    bounce_off(direction: :vertical) if collide_vertically
  end

  def collide_horizontally
    @x >= right_edge || @x <= left_edge
  end

  def collide_vertically
    @y >= top_edge || @y <= bottom_edge
  end

  def bottom_edge
    0
  end

  def left_edge
    0
  end

  def top_edge
    Viewport.height - height
  end

  def right_edge
    Viewport.width - width
  end
end
