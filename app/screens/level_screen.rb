class LevelScreen
  attr_accessor :ball, :paddle, :brick_layout

  def initialize
    @ball = Ball.new
    @paddle = Paddle.new
    @brick_layout = BrickLayout.new(rows: 6, columns: 14)
  end

  def tick
    pause_game
    paddle.tick
    ball.tick
  end

  def render
    BackgroundLayer.render()
    BallLayer.render(ball)
    BricksLayer.render(brick_layout)
    PaddleLayer.render(paddle)
  end

  private

  def pause_game
    return unless $args.inputs.keyboard.key_down.escape

    $args.outputs.sounds << "app/assets/sounds/pause.wav"
    $args.state.screen = :pause
  end
end
