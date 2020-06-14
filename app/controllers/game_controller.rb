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
      else
        start_screen
      end
    end

    def reset!
      @start_screen = nil
      @level_screen = nil
      @pause_screen = nil
      $gtk.reset
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
  end
end
