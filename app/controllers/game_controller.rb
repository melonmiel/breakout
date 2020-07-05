class GameController
  class << self
    def tick
      screen.tick
      screen.render
    end

    def screen
      case $args.state.screen
      when :pause
        pause_screen
      when :level
        level_screen
      when :start
        start_screen
      when :death
        death_screen
      when :settings
        settings_screen
      when :win
        win_screen
      else
        $args.state.screen = :start
        start_screen
      end
    end

    def reset!
      @start_screen = nil
      @level_screen = nil
      @pause_screen = nil
      @death_screen = nil
      @settings_screen = nil
      @win_screen = nil
    end

    def reset_level!
      @level_screen = nil
    end

    def start_screen
      @start_screen ||= StartScreen.new
    end

    def level_screen
      @level_screen ||= LevelScreen.new
    end

    def pause_screen
      @pause_screen ||= PauseScreen.new
    end

    def death_screen
      @death_screen ||= DeathScreen.new
    end

    def settings_screen
      @settings_screen ||= SettingsScreen.new
    end

    def win_screen
      @win_screen ||= WinScreen.new
    end
  end
end
