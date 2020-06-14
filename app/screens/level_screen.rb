class LevelScreen
  attr_accessor :ball, :paddle, :bricks
  attr_accessor :args

  def initialize
    @ball = Ball.new
    @paddle = Paddle.new
    @bricks = []
  end

  def tick
    paddle.tick
  end

  def render
    BackgroundLayer.render()
    BallLayer.render(ball)
    BricksLayer.render(bricks)
    PaddleLayer.render(paddle)
  end
end
