class GameTitleLayer
  class << self
    def render
      $args.outputs.labels << [Viewport.xcenter(0), Viewport.vcenter(-300), "BREAKOUT", 36, 1, 255, 255, 255]
    end
  end
end
