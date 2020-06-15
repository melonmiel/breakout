class GameTitleLayer
  class << self
    def render
      $args.outputs.labels << [Viewport.xcenter(0), Viewport.vcenter(-400), "BREAKOUT", 48, 1, *ColorPalette.pink, 255, "app/assets/fonts/RocketRinder.ttf"]
    end
  end
end
