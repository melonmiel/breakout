class GameController
  def tick
    screen.tick
    screen.render
  end

  def screen
    if $engine.state.paused
      # TODO: PauseScreen
    else
      LevelScreen
    end
  end
end
