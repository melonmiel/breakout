class Engine
  class Screen
    include Assets
    include Input

    attr_reader :controller

    def initialize(controller)
      @controller = controller
    end

    def boot(**args); end
  end
end
