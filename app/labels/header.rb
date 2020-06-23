class Header < Engine::Label
  def initialize(args = {})
    @x = args.fetch(:x, Viewport.xcenter)
    @y = args.fetch(:y, (Viewport.ycenter + 200))
    @text = args.fetch(:text)
    @size = args.fetch(:size, 48)
    @alignment = args.fetch(:alignment, 1)
    @color = args.fetch(:color, ColorPalette.pink)
    @alpha = args.fetch(:alpha, 255)
    @font = args.fetch(:font, "app/assets/fonts/RocketRinder.ttf")
  end
end
