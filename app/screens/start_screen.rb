class StartScreen < Engine::Screen
  include Engine::Assets

  def initialize
    $args.outputs.sounds << sound_path("start.ogg") if Settings.enabled?(:music)
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
    @menu ||= begin
      menu = Menu.new
      menu.add_option("NEW GAME") do
        $args.outputs.sounds << "app/assets/sounds/start-game.wav" if Settings.enabled?(:sound)
        $args.state.screen = :level
      end
      menu.add_option("QUIT") { exit }
      menu
    end
  end
end
