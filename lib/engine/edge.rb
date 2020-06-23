module Engine
  class Edge < Line
    class Left < Edge
      def contains?(solid)
        solid.left >= x
      end
    end

    class Right < Edge
      def contains?(solid)
        solid.right <= x
      end
    end

    class Top < Edge
      def contains?(solid)
        solid.top <= y
      end
    end

    class Bottom < Edge
      def contains?(solid)
        solid.bottom >= y
      end
    end
  end
end
