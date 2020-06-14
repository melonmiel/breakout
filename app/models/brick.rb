class Brick < Engine::Model
  WIDTH = 75
  HEIGHT = 40
  PADDING = 5

  def initialize(x, y, color: nil)
    @x = x
    @y = y
    @width = WIDTH
    @height = HEIGHT
    @color = color || ColorPalette.foreground
    @border = ColorPalette.background
  end
end
