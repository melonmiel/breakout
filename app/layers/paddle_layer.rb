class PaddleLayer
  class << self
    def render(paddle)
      $args.outputs.solids << [paddle.x, paddle.y, paddle.length, paddle.height, *paddle.color]
    end
  end
end
