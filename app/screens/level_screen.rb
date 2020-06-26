class LevelScreen < Engine::Screen
  include Engine::Assets
  include Engine::Collision

  attr_accessor :ball, :paddle, :brick_layout

  def initialize
    @ball = Ball.new
    @paddle = Paddle.new
    @brick_layout = BrickLayout.new(rows: 6, columns: 14)

    play_song("level.ogg") if Settings.enabled?(:music)
    $args.state.paused = false
  end

  def tick
    on_key(:space) { pause_game }
    on_keys(:escape, :enter) { level_menu }

    return if $args.state.paused

    paddle.tick
    ball.tick

    on_collision(ball.next_ball, [paddle]) do
      ball.bounce_off(paddle)
    end

    on_collision(ball.next_ball, brick_layout.bricks) do |brick|
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
      $args.state.screen = :death
    end
  end

  def render
    BackgroundLayer.render
    ball.render
    brick_layout.render
    paddle.render
    pause_indicator.render if $args.state.paused
  end

  private

  def pause_game
    $args.outputs.sounds << "app/assets/sounds/pause.wav" if Settings.enabled?(:sound)
    $args.state.paused = !$args.state.paused
  end

  def level_menu
    $args.outputs.sounds << "app/assets/sounds/pause.wav" if Settings.enabled?(:sound)
    $args.state.screen = :pause
  end

  def pause_indicator
    @pause_indicator ||= Engine::Label.new(x: Viewport.xcenter, y: Viewport.ycenter + 32, text: "GAME PAUSED", alignment: 1, size: 32, color: ColorPalette.text, font: font_path("RocketRinder.ttf"))
  end
end
