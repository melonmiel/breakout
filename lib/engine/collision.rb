module Engine
  module Collision
    def on_collision(source, destinations, &block)
      destinations.each do |destination|
        next unless source.rect.intersect_rect?(destination.rect)

        yield(destination)
      end
    end
  end
end
