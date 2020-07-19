class Engine
  class Game
    attr_accessor :current_scene, :scenes

    def initialize
      @current_scene = nil
      @scenes = {}
    end

    def controller
      # Defaults to first defined scene
      @current_scene ||= scenes.keys.first

      scenes.fetch(@current_scene) do
        raise Engine::Error, "I don't know how to render this scene '#{current_scene}'"
      end
    end

    def scene(scene, controller)
      scenes[scene] = controller
    end

    class << self
      # Setup scenes & routing
      def configure(&block)
        yield(instance)
      end

      def render(scene)
        instance.current_scene = scene
      end

      def run!(args)
        $args = args

        instance.controller.tick
        instance.controller.render
      end

      def instance
        @instance ||= new
      end
    end
  end
end
