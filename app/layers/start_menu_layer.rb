class StartMenuLayer
  class << self
    def render(start_menu)
      $args.outputs.labels << [Viewport.xcenter(0), Viewport.vcenter(0), "Press space to start game", 18, 1, 255, 255, 255, start_menu.alpha]
    end
  end
end
