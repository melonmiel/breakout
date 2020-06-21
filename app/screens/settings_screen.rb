class SettingsScreen < Engine::Screen
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
    @menu ||= begin
      menu = Menu.new
      menu.add_toggle(:sound, text: "Sound Effects")
      menu.add_toggle(:music, text: "Music")
      menu.add_option("BACK") do
        $args.state.screen = $args.state.back
      end
      menu
    end
  end
end
