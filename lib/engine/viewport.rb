class Viewport
  class << self
    def _container
      @_container ||= Engine::Container.new(x: 0, y: 0, width: 1280, height: 720)
    end

    def method_missing(method)
      _container.send(method)
    end
  end
end
