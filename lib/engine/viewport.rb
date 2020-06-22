class Viewport < Engine::Container
  def initialize
    super(x: 0, y: 0, width: 1280, height: 720)
  end

  class << self
    def instance
      @instance ||= new
    end

    def method_missing(method)
      instance.send(method)
    end
  end
end
