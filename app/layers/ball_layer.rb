class BallLayer
  class << self
    def render(ball)
      $args.outputs.solids << [ball.x, ball.y, ball.width, ball.height, *ball.color]
    end
  end
end
