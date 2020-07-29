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

  def serialize
    super.merge(exploded: exploded)
  end

  def explode!
    @exploded = true
    play_sound("blip.wav") if Engine::Settings.enabled?(:sound)
  end

  def render
    return if exploded?

    super
  end
end
