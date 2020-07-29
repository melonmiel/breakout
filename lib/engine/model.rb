class Engine
  class Model
    include Serializable

    attr_accessor :x, :y, :width, :height, :color, :border, :alpha, :font

    def initialize(x: nil, y: nil, width: nil, height: nil, color: nil, border: nil)
      @x = x
      @y = y
      @width = width
      @height = height
      @color = color
      @border = border
    end

    def serialize
      {
        x: x,
        y: y,
        width: width,
        height: height,
        color: color,
        border: border,
        alpha: alpha,
        font: font,
      }
    end

    def alpha
      @alpha || 255
    end

    def font
      @font || "font.ttf"
    end

    def rect
      [x, y, width, height]
    end

    def left
      x
    end

    def right
      x + width
    end

    def top
      y + height
    end

    def bottom
      y
    end

    def outside?(container)
      !container.contains?(self)
    end

    def beyond?(edge)
      !edge.contains?(self)
    end

    def collides?(destination)
      GTK::Geometry.intersect_rect?(rect, destination.rect)
    end

    def render
      $args.outputs.solids << [x, y, width, height, *color, alpha, font].compact
    end
  end
end
