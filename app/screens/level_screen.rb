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
      brick_layout.delete_brick(brick)
      ball.bounce_off(direction: :vertical)
    end

    on_collision(ball, [bottom_edge]) do
      die
    end
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

  def die
    GameController.reset!
  end

  def bottom_edge
    @bottom_edge ||= begin
      bottom_edge = Engine::Model.new
      bottom_edge.x = 0
      bottom_edge.y = 0
      bottom_edge.width = Viewport.width
      bottom_edge.height = 0
      bottom_edge
    end
  end
end
