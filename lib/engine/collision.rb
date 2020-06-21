module Engine
  module Collision
    def on_collision(source, destinations, &block)
      destinations.each do |destination|
        on_edge_collision(source, destination, &block) if destination.is_a?(Edge)
        on_solid_collision(source, destination, &block) if destination.is_a?(Model)
      end
    end

    def on_edge_collision(source, edge, &block)
      return unless outside?(source, edge)

      yield(edge)
    end

    def on_solid_collision(source, destination, &block)
      return unless collides?(source, destination)

      yield(destination)
    end

    def collides?(source, destination)
      GTK::Geometry.intersect_rect?(source.rect, destination.rect)
    end

    def outside?(source, edge)
      if edge.is_a? Engine::Edge::Left
        source.x < edge.x
      elsif edge.is_a? Engine::Edge::Right
        (source.x + source.width) > edge.x
      elsif edge.is_a? Engine::Edge::Top
        (source.y + source.height) > edge.y
      elsif edge.is_a? Engine::Edge::Bottom
        source.y < edge.y
      else
        false
      end
    end
  end
end
