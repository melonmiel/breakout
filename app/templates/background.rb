class Background
  class << self
    def render(args)
      args.outputs.solids << [0, 0, 1280, 720]
    end
  end
end
