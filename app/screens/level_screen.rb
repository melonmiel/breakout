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

    on_collision(ball.next_move, [paddle]) do
      ball.bounce_off(direction: :vertical)
    end

    on_collision(ball.next_move, brick_layout.bricks) do |brick|
      brick.explode!
      ball.bounce_off(direction: :vertical)
    end

    on_collision(ball, [Viewport.left, Viewport.right]) do
      ball.bounce_off(direction: :horizontal)
    end

    on_collision(ball, [Viewport.top]) do
      ball.bounce_off(direction: :vertical)
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
