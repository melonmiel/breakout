class MenuItem < Engine::Label
  BLINK_SPEED = 2.5

  attr_accessor :selected, :on_select

  alias :selected? :selected

  def initialize(args = {}, &block)
    @x = args.fetch(:x, Viewport.xcenter(0))
    @y = args.fetch(:y, Viewport.ycenter(-400))
    @text = args.fetch(:text)
    @size = args.fetch(:size, 24)
    @alignment = args.fetch(:alignment, 1)
    @font = args.fetch(:font, "app/assets/fonts/VerminVibes1989Regular.ttf")

    @fade = :in
    @selected = args.fetch(:selected, false)
    @on_select = args.fetch(:on_select)
  end

  def select!
    @selected = true
    $args.outputs.sounds << "app/assets/sounds/select.wav"
  end

  def unselect!
    @selected = false
  end

  def color
    selected? ? ColorPalette.cyan : ColorPalette.text
  end

  def alpha
    return 255 unless selected

    @fade = @fade == :in ? :out : :in if blink_gauge == 0
    255 - (@fade == :out ? blink_gauge : 100-blink_gauge)
  end

  def blink_gauge
    ($args.tick_count * BLINK_SPEED) % 100
  end
end
