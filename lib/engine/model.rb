module Engine
  class Model
    attr_accessor :x, :y, :width, :height, :color, :border, :alpha, :font

    def alpha
      @alpha || 255
    end

    def font
      @font || "app/assets/fonts/VerminVibes1989Regular.ttf"
    end
  end
end
