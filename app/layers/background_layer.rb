class BackgroundLayer
  class << self
    def render
      $args.outputs.solids << [0, 0, 1280, 720, *Colors.background]
    end
  end
end
