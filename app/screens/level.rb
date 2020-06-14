class Level
  class << self
    def render(args)
      Background.render(args)
      Paddle.render(args)
    end
  end
end
