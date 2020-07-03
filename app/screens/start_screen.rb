class StartScreen < Engine::Screen
  def initialize
    play_song("start.ogg") if Engine::Settings.enabled?(:music)
  end

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
        $args.state.screen = :level
      end
      menu.add_option(text: "SETTINGS") do
        $args.state.back = :start
        $args.state.screen = :settings
      end
      menu.add_option(text: "QUIT") { exit }
    end
  end
end
