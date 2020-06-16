class LevelScreen
  include Engine::Collision

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

    on_collision(ball.next_ball, [paddle]) do
      ball.bounce_off(paddle)
    end

    on_collision(ball.next_ball, brick_layout.bricks) do |brick|
      brick.explode!
      ball.bounce_off(brick)
    end

    on_collision(ball.next_ball, [Viewport.left, Viewport.right]) do |edge|
      ball.bounce_off(edge)
    end

    on_collision(ball.next_ball, [Viewport.top]) do |edge|
      ball.bounce_off(edge)
    end

    on_collision(ball, [Viewport.bottom]) do
      die
    end
  end

  def render
    BackgroundLayer.render
    ball.render
    brick_layout.render
    paddle.render
  end

  private

  def pause_game
    return unless $args.inputs.keyboard.key_down.escape

    $args.outputs.sounds << "app/assets/sounds/pause.wav"
    $args.state.screen = :pause
  end

  def die
    GameController.reset!
  end
end
