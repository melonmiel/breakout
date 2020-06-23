module Engine
  class Model
    attr_accessor :x, :y, :width, :height, :color, :border, :alpha, :font

    def initialize(x: nil, y: nil, width: nil, height: nil)
      @x = x
      @y = y
      @width = width
      @height = height
    end

    def alpha
      @alpha || 255
    end

    def font
      @font || "app/assets/fonts/VerminVibes1989Regular.ttf"
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
  end
end
