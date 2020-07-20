require "lib/engine.rb"
require "config/boot.rb"

def tick(args)
  Engine::Game.run!(args)

  # TODO: Work with environment variables
  # TODO: Display only if developping
  $args.outputs.labels << [10, 710, args.gtk.current_framerate&.to_i, 255, 255, 255]
end
