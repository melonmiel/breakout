class MenuItem < Engine::Model
  BLINK_SPEED = 2.5

  attr_accessor :label, :selected

  def initialize(label, x: nil, y: nil, selected: false)
    @label = label
    @x = x || Viewport.xcenter(0)
    @y = y || 0
    @font = "app/assets/fonts/VerminVibes1989Regular.ttf"
    @selected = selected
    @fade = :in
  end

  def select!
    @selected = true
  end

  def unselect!
    @selected = false
  end

  def selected?
    selected
  end

  def color
    @color = selected ? ColorPalette.cyan : ColorPalette.text
  end

  def alpha
    if selected
      @fade = @fade == :in ? :out : :in if blink_gauge == 0
      @alpha = 255 - (@fade == :out ? blink_gauge : 100-blink_gauge)
    else
      @alpha = 255
    end
  end

  def blink_gauge
    ($args.tick_count * BLINK_SPEED) % 100
  end
end
