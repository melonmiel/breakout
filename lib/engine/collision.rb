module Engine
  module Collision
    def on_collision(source, destinations, &block)
      destinations.each do |destination|
        on_edge_collision(source, destination, &block) if destination.is_a?(Edge)
        on_solid_collision(source, destination, &block) if destination.is_a?(Model)
      end
    end

    def on_edge_collision(source, edge, &block)
      return if edge.contains?(source)

      yield(edge)
    end

    def on_solid_collision(source, destination, &block)
      return unless collides?(source, destination)

      yield(destination)
    end

    def collides?(source, destination)
      GTK::Geometry.intersect_rect?(source.rect, destination.rect)
    end
  end
end
