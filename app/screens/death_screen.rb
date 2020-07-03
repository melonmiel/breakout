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
    @menu ||= Menu.new do |menu|
      menu.add_option(text: "RETRY") do
        play_sound("resume.wav") if Engine::Settings.enabled?(:sound)
        $args.state.screen = :level
        GameController.reset_level!
      end
      menu.add_option(text: "BACK TO MAIN MENU") { GameController.reset! }
      menu.add_option(text: "QUIT") { exit }
    end
  end
end
