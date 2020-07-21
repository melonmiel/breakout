class Engine
  class Controller
    include Assets
    include Input

    attr_accessor :current_screen

    def boot; end

    def tick
      current_screen.tick
    end

    def render
      current_screen.render
    end

    def paint(screen)
      @current_screen = screen
    end
  end
end
