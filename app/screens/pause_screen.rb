class PauseScreen < Engine::Screen
  def tick
    menu.tick
  end

  def render
    BackgroundLayer.render
    game_title.render
    menu.render
  end

  private

  def menu
    @menu ||= Menu.new do |menu|
      menu.add_option(text: "RESUME") do
        play_sound("resume.wav") if Engine::Settings.enabled?(:sound)
        $args.state.screen = :level
      end
      menu.add_option(text: "BACK TO MAIN MENU") { GameController.reset! }
      menu.add_option(text: "QUIT") { exit }
    end
  end

  def game_title
    @game_title ||= Header.new(text: "BREAKOUT")
  end
end
