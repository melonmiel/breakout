class InGameMenuScreen < Engine::Screen
  include Engine::Input

  def tick
    # Easy peasy cheating
    # TODO: Implement Konami code
    on_key_down(:n) { controller.complete_level! }

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
      menu.add_option(text: "RESUME") { controller.resume }
      menu.add_option(text: "BACK TO MAIN MENU") { controller.back_to_main_menu }
      menu.add_option(text: "QUIT") { controller.quit }
    end
  end

  def game_title
    @game_title ||= Header.new(text: "BREAKOUT")
  end
end
