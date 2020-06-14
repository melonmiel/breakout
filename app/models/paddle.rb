class Paddle
  DEFAULT_LENGTH = 100
  DEFAULT_SPEED = 10
  PADDLE_HEIGHT = 10
  POSITION_Y = 15
  COLOR = [255, 255, 255].freeze

  attr_accessor :x, :length, :speed

  def initialize
    @length = DEFAULT_LENGTH
    @speed = DEFAULT_SPEED
    @x = Viewport.center(length)
  end

  def render(args)
    accelerate(args)
    move(args)
    [x, POSITION_Y, length, PADDLE_HEIGHT, *COLOR]
  end

  private

  def accelerate(args)
    if args.inputs.keyboard.key_held.left || args.inputs.keyboard.key_held.right
      @speed += 0.5
    else
      @speed = DEFAULT_SPEED
    end
  end

  def move(args)
    move_left(args)
    move_right(args)
  end

  def move_left(args)
    return unless can_move_left?
    return unless args.inputs.keyboard.key_down.left || args.inputs.keyboard.key_held.left

    @x -= speed
    @x = 0 if @x < 0
  end

  def move_right(args)
    return unless can_move_right?
    return unless args.inputs.keyboard.key_down.right || args.inputs.keyboard.key_held.right

    @x += speed
    @x = (Viewport.width - length) if @x > (Viewport.width - length)
  end

  def can_move_left?
    @x != 0
  end

  def can_move_right?
    @x != (Viewport.width - length)
  end

  class << self
    def render(args)
      args.outputs.solids << $paddle.render(args)
    end
  end
end

$paddle = Paddle.new