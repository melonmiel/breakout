class Brick < Engine::Model
  include Engine::Assets

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
    @color = color || Colors.foreground
    @border = Colors.background
    @exploded = false
  end

  def explode!
    @exploded = true
    $args.state.score += 100
    play_sound("blip.wav") if Engine::Settings.enabled?(:sound)
  end

  def render
    return if exploded?

    $args.outputs.solids << [x, y, width, height, *color]
    $args.outputs.borders << [x, y, width, height, *border]
  end
end
