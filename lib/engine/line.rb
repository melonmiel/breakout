class Engine
  # The parameters required for lines are:
  # 1. The initial point (x, y)
  # 2. The end point (x2, y2)
  # 3. The rgba values for the color and transparency (r, g, b, a)

  # An example of creating a line would be:
  # args.outputs.lines << [100, 100, 300, 300, 255, 0, 255, 255]
  class Line
    include Serializable

    attr_accessor :x, :y, :x2, :y2, :color, :alpha

    def initialize(args = {})
      @x = args.fetch(:x)
      @y = args.fetch(:y)
      @x2 = args.fetch(:x2)
      @y2 = args.fetch(:y2)
      @color = args.fetch(:color, nil)
      @alpha = args.fetch(:alpha, nil)
    end

    def serialize
      {
        x: x,
        y: y,
        x2: x2,
        y2: y2,
        color: color,
        alpha: alpha,
      }
    end

    def rect
      GTK::Geometry.line_rect(self)
    end

    def render
      $args.outputs.lines << [x, y, x2, y2, *color, alpha].compact
    end

    def width
      (x2-x).abs
    end

    def height
      (y2-y).abs
    end
  end
end
