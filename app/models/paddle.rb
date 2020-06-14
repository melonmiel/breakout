class Paddle < Models::Base
  DEFAULT_LENGTH = 100
  DEFAULT_SPEED = 10
  PADDLE_HEIGHT = 10
  POSITION_Y = 15
  COLOR = [255, 255, 255].freeze

  def initialize
    @length = DEFAULT_LENGTH
    @x = Viewport.center(length)
    @y = POSITION_Y
    @height = PADDLE_HEIGHT
    @color = COLOR

    @speed = DEFAULT_SPEED
  end

  def tick
    accelerate
    move
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
    return unless $args.inputs.keyboard.key_down.left || $args.inputs.keyboard.key_held.left

    @x -= @speed
    @x = left_edge if @x < left_edge
  end

  def move_right
    return unless can_move_right?
    return unless $args.inputs.keyboard.key_down.right || $args.inputs.keyboard.key_held.right

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
    Viewport.width - length
  end
end
