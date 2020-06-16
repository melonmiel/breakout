class PauseScreen
  attr_accessor :pause_menu

  def initialize
    @pause_menu = PauseMenu.new
  end

  def tick
    pause_menu.tick
  end

  def render
    BackgroundLayer.render
    GameTitleLayer.render
    pause_menu.render
  end
end
