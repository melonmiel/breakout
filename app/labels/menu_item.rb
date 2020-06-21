class MenuItem < Engine::Label
  attr_accessor :selected, :on_select

  alias :selected? :selected

  def initialize(args = {}, &block)
    @x = args.fetch(:x, Viewport.xcenter(0))
    @y = args.fetch(:y, Viewport.ycenter(-400))
    @text = args.fetch(:text)
    @size = args.fetch(:size, 18)
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
    selected? ? ossilator.value : 255
  end

  private

  def ossilator
    @ossilator ||= Effects::Ossilator.new(range: (150..255), interval: 5)
  end
end
