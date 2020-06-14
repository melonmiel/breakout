class BricksLayer
  class << self
    def render(brick_layout)
      brick_layout.bricks.each do |brick|
        $args.outputs.solids << [brick.x, brick.y, brick.width, brick.height, *brick.color]
        $args.outputs.borders << [brick.x, brick.y, brick.width, brick.height, *brick.border]
      end
    end
  end
end
