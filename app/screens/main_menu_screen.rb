class MainMenuScreen < Engine::Screen
  def tick
    menu.tick
  end

  def render
    BackgroundLayer.render
    game_title.render
    menu.render
  end

  private

  def game_title
    @game_title ||= Header.new(text: "BREAKOUT")
  end

  def menu
    @menu ||= Menu.new do |menu|
      menu.add_option(text: "NEW GAME", selected: true) do
        play_sound("start-game.wav") if Engine::Settings.enabled?(:sound)
        controller.play
      end
      menu.add_option(text: "SETTINGS") do
        controller.settings
      end
      menu.add_option(text: "QUIT") do
        controller.quit
      end
    end
  end
end
