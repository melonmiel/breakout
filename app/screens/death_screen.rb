class DeathScreen < Engine::Screen
  def tick
    menu.tick
  end

  def render
    BackgroundLayer.render
    mortem_label.render
    menu.render
  end

  def mortem_label
    @mortem_label ||= Header.new(text: "MORTEM")
  end

  def menu
    @menu ||= begin
      menu = Menu.new
      menu.add_option("RETRY") do
        $args.outputs.sounds << "app/assets/sounds/resume.wav"
        $args.state.screen = :level
        GameController.reset_level!
      end
      menu.add_option("BACK TO MAIN MENU") { GameController.reset! }
      menu.add_option("QUIT") { exit }
      menu
    end
  end
end
