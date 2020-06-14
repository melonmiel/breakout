class GameController
  attr_accessor :args

  def tick(args)
    @args = args

    screen.render(args)
  end

  def screen
    Level
  end
end
