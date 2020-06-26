class SettingsScreen < Engine::Screen
  include Engine::Assets

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
      menu.add_setting(:sound, text: "Sound Effects") do |select|
        select.add_option(true, text: "On", color: ColorPalette.green)
        select.add_option(false, text: "Off", color: ColorPalette.red)
      end
      menu.add_setting(:music, text: "Music") do |select|
        select.add_option(true, text: "On", color: ColorPalette.green) do
          play_song("start.ogg")
        end
        select.add_option(false, text: "Off", color: ColorPalette.red) do
          stop_music
        end
      end
      menu.add_setting(:difficulty, text: "Difficulty") do |select|
        select.add_option(:easy, text: "Easy", color: ColorPalette.green)
        select.add_option(:normal, text: "Normal", color: ColorPalette.yellow)
        select.add_option(:hard, text: "Hard", color: ColorPalette.red)
      end
      menu.add_option(text: "BACK") do
        $args.state.screen = $args.state.back
      end
    end
  end
end
