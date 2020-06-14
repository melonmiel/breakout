class LevelScreen
  attr_accessor :ball, :paddle, :brick_layout
  attr_accessor :args

  def initialize
    @ball = Ball.new
    @paddle = Paddle.new
    @brick_layout = BrickLayout.new(rows: 6, columns: 14)
  end

  def tick
    paddle.tick
  end

  def render
    BackgroundLayer.render()
    BallLayer.render(ball)
    BricksLayer.render(brick_layout)
    PaddleLayer.render(paddle)
  end
end
