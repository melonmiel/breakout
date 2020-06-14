class GameController
  class << self
    def tick
      screen.tick
      screen.render
    end

    def screen
      if $args.state.paused
        # TODO: PauseScreen
      else
        level_screen
      end
    end

    def level_screen
      @level_screen ||= LevelScreen.new
    end
  end
end
