class LevelScreen < Engine::Screen
  include Engine::Collision

  attr_accessor :ball, :bricks, :paddle, :level

  def setup(level:)
    @level = level
    @ball = Ball.new
    @paddle = Paddle.new
    @bricks = @level.bricks
  end

  def tick
    on_key_down(:escape, :enter) { controller.render_menu }

    level.tick
    paddle.tick
    ball.tick

    on_collision(ball.next_ball, [paddle]) do
      ball.bounce_off(paddle)
    end

    on_collision(ball.next_ball, bricks) do |brick|
      brick.explode!
      ball.bounce_off(brick)
    end

    on_collision(ball.next_ball, [Viewport.left, Viewport.right]) do
      ball.bounce_horizontally
    end

    on_collision(ball.next_ball, [Viewport.top]) do
      ball.bounce_vertically
    end

    on_collision(ball, [Viewport.bottom]) do
      controller.die
    end
  end

  def render
    BackgroundLayer.render
    level.render
    ball.render
    paddle.render
  end
end
