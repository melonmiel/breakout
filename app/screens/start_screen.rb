class StartScreen
  attr_accessor :start_menu

  def initialize
    @start_menu = StartMenu.new
  end

  def tick
    start_menu.tick
  end

  def render
    BackgroundLayer.render
    GameTitleLayer.render
    StartMenuLayer.render(start_menu)
  end
end
