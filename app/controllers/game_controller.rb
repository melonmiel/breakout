class GameController
  class << self
    def tick
      screen.tick
      screen.render
    end

    def screen
      case $args.state.screen
      when :level
        level_screen
      else
        start_screen
      end
    end

    def start_screen
      @start_screen ||= StartScreen.new
    end

    def level_screen
      @level_screen ||= LevelScreen.new
    end
  end
end
