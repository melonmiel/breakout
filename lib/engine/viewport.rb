class Viewport
  WIDTH = 1280
  HEIGHT = 720

  class << self
    def xcenter(offset)
      (width - offset) / 2
    end
    alias :hcenter :xcenter

    def ycenter(offset)
      (height - offset) / 2
    end
    alias :vcenter :ycenter

    def width
      WIDTH
    end

    def height
      HEIGHT
    end

    def left
      @left ||= Engine::Model.new(x: 0, y: 0, width: 0, height: height)
    end

    def right
      @right ||= Engine::Model.new(x: width, y: 0, width: 0, height: height)
    end

    def bottom
      @bottom ||= Engine::Model.new(x: 0, y: 0, width: width, height: 0)
    end

    def top
      @top ||= Engine::Model.new(x: 0, y: height, width: width, height: 0)
    end
  end
end
