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
        controller.reset
      end
      menu.add_option(text: "BACK TO MAIN MENU") { controller.back_to_main_menu }
      menu.add_option(text: "QUIT") { controller.quit }
    end
  end
end
