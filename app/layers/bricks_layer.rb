class BricksLayer
  class << self
    def render(bricks)
      bricks.each do |brick|
        $args.outputs.solids << [brick.x, brick.y, brick.width, brick.height, *brick.color]
      end
    end
  end
end
