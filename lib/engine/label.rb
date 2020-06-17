module Engine
  class Label
    attr_accessor :x, :y, :text, :size, :alignment, :color, :alpha, :font

    def render
      $args.outputs.labels << [x, y, text, size, alignment, *color, alpha, font].compact
    end
  end
end
