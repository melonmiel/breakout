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
  end
end
