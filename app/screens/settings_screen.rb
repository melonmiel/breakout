class SettingsScreen < Engine::Screen
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
        select.add_option(true, text: "On", color: Colors.green)
        select.add_option(false, text: "Off", color: Colors.red)
      end
      menu.add_setting(:music, text: "Music") do |select|
        select.add_option(true, text: "On", color: Colors.green) do
          play_song("start.ogg")
        end
        select.add_option(false, text: "Off", color: Colors.red) do
          stop_music
        end
      end
      menu.add_setting(:difficulty, text: "Difficulty") do |select|
        select.add_option("easy", text: "Easy", color: Colors.green)
        select.add_option("normal", text: "Normal", color: Colors.yellow)
        select.add_option("hard", text: "Hard", color: Colors.red)
      end
      menu.add_option(text: "BACK") do
        controller.back
      end
    end
  end
end
