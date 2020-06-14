class PauseScreen
  attr_accessor :pause_screen

  def initialize
    @pause_screen = PauseMenu.new
  end

  def tick
    pause_screen.tick
  end

  def render
    BackgroundLayer.render
    GameTitleLayer.render
    MenuLayer.render(pause_screen)
  end
end
