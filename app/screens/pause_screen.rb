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
    @menu ||= begin
      menu = Menu.new
      menu.add_option("RESUME") do
        $args.outputs.sounds << "app/assets/sounds/resume.wav" if Settings.enabled?(:sound)
        $args.state.screen = :level
      end
      menu.add_option("BACK TO MAIN MENU") { GameController.reset! }
      menu.add_option("QUIT") { exit }
      menu
    end
  end

  def game_title
    @game_title ||= Header.new(text: "BREAKOUT")
  end
end
