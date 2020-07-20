class LevelScreen < Engine::Screen
  include Engine::Collision

  attr_accessor :ball, :playground, :statistics, :paddle, :level, :score

  def boot(level:)
    @playground = Engine::Container.new(x: 0, y: 0, width: 1280, height: 660, color: Colors.background)
    @statistics = Engine::Container.new(x: 0, y: 660, width: 1280, height: 60, color: Colors.background)
    @level = level
    @ball = Ball.new
    @paddle = Paddle.new
    @score = Score.new

    @level.boot(container: playground)
    @score.boot(container: statistics)
  end

  def tick
    on_key_down(:escape, :enter) { controller.render_menu }

    score.tick
    level.tick
    paddle.tick
    ball.tick

    on_collision(ball.next_ball, [paddle]) do
      ball.bounce_off(paddle)
    end

    on_collision(ball.next_ball, level.bricks) do |brick|
      brick.explode!
      ball.bounce_off(brick)
    end

    on_collision(ball.next_ball, [playground.left, playground.right]) do
      ball.bounce_horizontally
    end

    on_collision(ball.next_ball, [playground.top]) do
      ball.bounce_vertically
    end

    on_collision(ball, [playground.bottom]) do
      controller.die
    end
  end

  def render
    statistics.render
    score.render

    playground.render
    level.render
    ball.render
    paddle.render
  end
end
