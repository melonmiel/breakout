class LevelScreen
  class << self
    def tick
      $paddle.tick
    end

    def render
      BackgroundLayer.render
      PaddleLayer.render
    end
  end
end
