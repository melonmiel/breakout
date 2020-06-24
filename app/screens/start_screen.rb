class StartScreen < Engine::Screen
  include Engine::Assets

  def initialize
    play_song("start.ogg") if Settings.enabled?(:music)
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
        $args.outputs.sounds << "app/assets/sounds/start-game.wav" if Settings.enabled?(:sound)
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
