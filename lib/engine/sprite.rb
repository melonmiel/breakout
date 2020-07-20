class Engine
  class Sprite
    attr_accessor :x, :y, :width, :height, :sprite_path, :rotation, :alpha

    def initialize(args = {})
      @x = args.fetch(:x, nil)
      @y = args.fetch(:y, nil)
      @width = args.fetch(:width, nil)
      @height = args.fetch(:height, nil)
      @sprite_path = args.fetch(:sprite_path, nil)
      @rotation = args.fetch(:rotation, 0)
      @alpha = args.fetch(:alpha, 255)
    end

    def render
      return unless valid?

      $args.outputs.sprites << [x, y, width, height, sprite_path, rotation, alpha]
    end

    def validate!
      raise ArgumentError, "Missing `x`" if x.nil?
      raise ArgumentError, "Missing `y`" if y.nil?
      raise ArgumentError, "Missing `width`" if width.nil?
      raise ArgumentError, "Missing `height`" if height.nil?
      raise ArgumentError, "Missing `sprite_path`" if sprite_path.nil?
    end

    def valid?
      validate!
      true
    rescue ArgumentError => ex
      puts ex.message
    end
  end
end
