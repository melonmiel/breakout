class Viewport
  WIDTH = 1280
  HEIGHT = 720

  class << self
    def xcenter(offset)
      (width - offset) / 2
    end

    def vcenter(offset)
      (height - offset) / 2
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
