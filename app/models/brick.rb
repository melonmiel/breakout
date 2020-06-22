class Brick < Engine::Model
  WIDTH = 75
  HEIGHT = 40
  PADDING = 5

  attr_accessor :exploded
  alias :exploded? :exploded

  def initialize(x, y, color: nil)
    @x = x
    @y = y
    @width = WIDTH
    @height = HEIGHT
    @color = color || ColorPalette.foreground
    @border = ColorPalette.background
    @exploded = false
  end

  def explode!
    @exploded = true
  end

  def render
    if exploded?
      $args.outputs.sounds << "app/assets/sounds/blip.wav" if Settings.enabled?(:sound)
    else
      $args.outputs.solids << [x, y, width, height, *color]
      $args.outputs.borders << [x, y, width, height, *border]
    end
  end
end
