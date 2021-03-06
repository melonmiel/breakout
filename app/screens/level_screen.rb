class LevelScreen < Engine::Screen
  include Engine::Collision

  HEALTH_BONUS_THRESHOLD = 20

  # TODO: Move to state machine
  attr_accessor :started
  alias :started? :started

  attr_accessor :ball, :playground, :statistics, :paddle, :level, :score, :health, :title

  def boot(level:)
    @playground = Engine::Container.new(x: 0, y: 0, width: 1280, height: 660, color: Colors.background)
    @statistics = Engine::Container.new(x: 0, y: 660, width: 1280, height: 60, color: Colors.foreground)
    @level = level
    @ball = Ball.new
    @paddle = Paddle.new
    @score = Score.new
    @health = Health.new
    @title = LevelTitle.new(@level.title)
    @started = false

    @level.boot(container: playground)
    @score.boot(container: statistics)
    @health.boot(container: statistics)
    @title.boot(container: statistics)
  end

  def reset
    @ball = Ball.new
    @paddle = Paddle.new
    @started = false
    reset_consecutive_hits
  end

  def start
    @started = true
  end

  def tick
    on_key_down(:escape, :enter) { controller.render_menu }

    if started?
      move_paddle
      ball.travel!
      handle_collisions
    else
      move_paddle
      sticky_ball
    end
  end

  def render
    statistics.render
    score.render
    health.render
    title.render

    playground.render
    level.render
    ball.render
    paddle.render
  end

  def handle_collisions
    on_collision(ball, paddle) do
      ball.bounce(direction: :vertical)
    end

    on_collision(ball, *level.bricks) do |brick|
      ball.bounce_off(brick)
      brick.explode!
      score_points
      award_health_bonus
    end

    on_collision(ball, playground.left, playground.right) do
      ball.bounce(direction: :horizontal)
    end

    on_collision(ball, playground.top) do
      ball.bounce(direction: :vertical)
    end

    on_collision(ball, playground.bottom) do
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

  def score_points
    $args.state.score += (10 * ball.speed).to_i
  end

  def award_health_bonus
    $args.state.consecutive_hits += 1
    if $args.state.consecutive_hits >= HEALTH_BONUS_THRESHOLD
      reset_consecutive_hits
      $args.state.health += 1
    end
  end

  def reset_consecutive_hits
    $args.state.consecutive_hits = 0
  end

  def sticky_ball
    ball.x = paddle.center
  end
end
