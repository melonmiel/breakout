class Paddle < Engine::Model
  DEFAULT_HEIGHT = 10
  DEFAULT_SPEED = 10
  POSITION_Y = 15

  def initialize
    @x = Viewport.xcenter - (width / 2)
    @y = POSITION_Y
    @height = DEFAULT_HEIGHT
    @color = ColorPalette.foreground

    @speed = DEFAULT_SPEED
  end

  def tick
    accelerate
    move
  end

  def render
    $args.outputs.solids << [x, y, width, height, *color]
  end

  private

  def accelerate
    if $args.inputs.keyboard.key_held.left || $args.inputs.keyboard.key_held.right
      @speed += 0.5
    else
      @speed = DEFAULT_SPEED
    end
  end

  def move
    move_left
    move_right
  end

  def move_left
    return unless can_move_left?
    return unless $args.inputs.keyboard.key_press(:left)

    @x -= @speed
    @x = left_edge if @x < left_edge
  end

  def move_right
    return unless can_move_right?
    return unless $args.inputs.keyboard.key_press(:right)

    @x += @speed
    @x = right_edge if @x > right_edge
  end

  def can_move_left?
    @x > left_edge
  end

  def can_move_right?
    @x < right_edge
  end

  def left_edge
    0
  end

  def right_edge
    Viewport.width - width
  end

  def width
    @width ||= begin
      case Settings.get(:difficulty)
      when :easy then 200
      when :normal then 150
      when :hard then 100
      else
        150
      end
    end
  end
end
