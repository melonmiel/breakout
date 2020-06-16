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
  end
end
