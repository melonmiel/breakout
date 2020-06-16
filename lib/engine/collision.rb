module Engine
  module Collision
    def on_collision(source, destinations, &block)
      destinations.each do |destination|
        next unless GTK::Geometry.intersect_rect?(source.rect, destination.rect)

        yield(destination)
      end
    end
  end
end
