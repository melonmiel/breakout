class Brick < Engine::Model
  WIDTH = 75
  HEIGHT = 40
  BRICK_COLOR = [255, 255, 255].freeze
  BORDER_COLOR = [0, 0, 0].freeze
  PADDING = 5

  def initialize(x, y)
    @x = x
    @y = y
    @width = WIDTH
    @height = HEIGHT
    @color = BRICK_COLOR
    @border = BORDER_COLOR
  end
end
