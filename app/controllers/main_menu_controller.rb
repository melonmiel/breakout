class MainMenuController < Engine::Controller
  def boot
    paint(main_menu_screen)
    play_song("start.ogg") if Engine::Settings.enabled?(:music)
  end

  def back
    paint(main_menu_screen)
  end

  def play
    Engine::Game.render(:levels)
  end

  def quit
    exit
  end

  def settings
    paint(settings_screen)
  end

  private

  def main_menu_screen
    @main_menu_screen ||= MainMenuScreen.new(self)
  end

  def settings_screen
    @settings_screen ||= SettingsScreen.new(self)
  end
end
