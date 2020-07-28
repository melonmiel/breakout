class LevelScreen < Engine::Screen
  include Engine::Collision

  # TODO: Move to state machine
  attr_accessor :started
  alias :started? :started

  attr_accessor :ball, :playground, :statistics, :paddle, :level, :score, :health

  def boot(level:)
    @playground = Engine::Container.new(x: 0, y: 0, width: 1280, height: 660, color: Colors.background)
    @statistics = Engine::Container.new(x: 0, y: 660, width: 1280, height: 60, color: Colors.foreground)
    @level = level
    @ball = Ball.new
    @paddle = Paddle.new
    @score = Score.new
    @health = Health.new
    @started = false

    @level.boot(container: playground)
    @score.boot(container: statistics)
    @health.boot(container: statistics)
  end

  def reset
    @ball = Ball.new
    @paddle = Paddle.new
    @started = false
  end

  def tick
    on_key_down(:space) { @started = true }
    on_key_down(:escape, :enter) { controller.render_menu }

    move_paddle
    started? ? ball.travel! : sticky_ball
    handle_collisions
  end

  def render
    statistics.render
    score.render
    health.render

    playground.render
    level.render
    ball.render
    paddle.render
  end

  def handle_collisions
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

  def move_paddle
    handle_paddle_acceleration

    on_key_down(:left, :a) { paddle.move_left }
    on_key_held(:left, :a) { paddle.move_left }

    on_key_down(:right, :d) { paddle.move_right }
    on_key_held(:right, :d) { paddle.move_right }
  end

  def handle_paddle_acceleration
    if key_held?(:a, :d, :left, :right)
      paddle.accelerate
    else
      paddle.reset_acceleration
    end
  end

  def sticky_ball
    ball.x = paddle.center
  end
end
