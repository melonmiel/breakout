class Brick < Engine::Model
  include State

  WIDTH = 75
  HEIGHT = 40
  PADDING = 5

  state Idle, events: [:explode]
  # events :explode

  def initialize(x, y, color: nil)
    @x = x
    @y = y
    @width = WIDTH
    @height = HEIGHT
    @color = color || ColorPalette.foreground
    @border = ColorPalette.background
    @exploded = false
  end

  class Idle < State
    on_event :explode, transition_to: Exploding

    def render
      $args.outputs.solids << [@parent.x, @parent.y, @parent.width, @parent.height, *@parent.color]
      $args.outputs.borders << [@parent.x, @parent.y, @parent.width, @parent.height, *@parent.border]
    end
  end

  class Exploding < State
    include Sound

    on_enter { play_sound "app/assets/sounds/blip.wav" }
    on_tick { transition_to Exploded }
  end

  class Exploded < State; end
end
