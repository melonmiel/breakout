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
      menu.add_option(text: "NEXT LEVEL") { controller.play }
      menu.add_option(text: "BACK TO MAIN MENU") { controller.back_to_main_menu }
      menu.add_option(text: "QUIT") { controller.quit }
    end
  end
end
