module Engine
  class Container < Model
    def contains?(solid)
      left.contains?(solid) &&
      right.contains?(solid) &&
      top.contains?(solid) &&
      bottom.contains?(solid)
    end

    def xcenter
      x + width / 2
    end

    def ycenter
      y + height / 2
    end

    def left
      @left ||= Edge::Left.new(x: x, y: y, x2: x, y2: (y + height))
    end

    def right
      @right ||= Edge::Right.new(x: (x + width), y: y, x2: (x + width), y2: (y + height))
    end

    def bottom
      @bottom ||= Edge::Bottom.new(x: x, y: y, x2: (x + width), y2: y)
    end

    def top
      @top ||= Edge::Top.new(x: x, y: (y + height), x2: (x + width), y2: (y + height))
    end
  end
end
