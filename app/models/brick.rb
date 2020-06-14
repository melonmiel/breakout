class Brick < Engine::Model
  WIDTH = 75
  HEIGHT = 40
  PADDING = 5

  def initialize(x, y)
    @x = x
    @y = y
    @width = WIDTH
    @height = HEIGHT
    @color = ColorPalette.default
    @border = ColorPalette.background
  end
end
