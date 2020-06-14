class Viewport
  WIDTH = 1280
  HEIGHT = 720

  class << self
    def center(length)
      (width - length) / 2
    end

    def width
      WIDTH
    end

    def height
      HEIGHT
    end

    def left
      0
    end

    def right
      WIDTH
    end

    def bottom
      0
    end

    def top
      HEIGHT
    end
  end
end
