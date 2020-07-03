class Engine
  module Collision
    def on_collision(source, destinations, &block)
      destinations.each do |destination|
        on_edge_collision(source, destination, &block) if destination.is_a?(Edge)
        on_solid_collision(source, destination, &block) if destination.is_a?(Model)
      end
    end

    def on_edge_collision(source, edge, &block)
      return unless source.beyond?(edge)

      yield(edge)
    end

    def on_solid_collision(source, solid, &block)
      return unless source.collides?(solid)

      yield(solid)
    end
  end
end
