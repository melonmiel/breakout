class WinScreen < Engine::Screen
  def tick
    menu.tick
  end

  def render
    BackgroundLayer.render
    win_label.render
    menu.render
  end

  def win_label
    @win_label ||= Header.new(text: "YOU WON!")
  end

  def menu
    @menu ||= Menu.new do |menu|
      menu.add_option(text: "NEW GAME") do
        play_sound("resume.wav") if Engine::Settings.enabled?(:sound)
        $args.state.screen = :level
        GameController.reset_level!
      end
      menu.add_option(text: "BACK TO MAIN MENU") do
        GameController.reset!
        $args.state.screen = :start
      end
      menu.add_option(text: "QUIT") { exit }
    end
  end
end
