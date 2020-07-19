class Engine
  class Controller
    include Assets
    include Input

    attr_accessor :current_screen

    def tick
      current_screen.tick
    end

    def render
      current_screen.render
    end

    def paint(screen, *args)
      @current_screen = screen
      @current_screen.setup(*args)
      @current_screen
    end
  end
end
