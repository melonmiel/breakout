class Engine
  class Label
    attr_accessor :x, :y, :text, :size, :alignment, :color, :alpha, :font

    def initialize(args = {})
      @x = args.fetch(:x, nil)
      @y = args.fetch(:y, nil)
      @text = args.fetch(:text, nil)
      @size = args.fetch(:size, nil)
      @alignment = args.fetch(:alignment, 0)
      @color = args.fetch(:color, [255, 255, 255])
      @alpha = args.fetch(:alpha, 255)
      @font = args.fetch(:font, nil)
    end

    def render
      $args.outputs.labels << [x, y, text, size, alignment, *color, alpha, font].compact
    end
  end
end
