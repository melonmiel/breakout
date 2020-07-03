require "lib/engine.rb"
require "config/boot.rb"

def tick(args)
  $args = args
  GameController.tick

  # TODO: Work with environment variables
  # TODO: Display only if developping
  $args.outputs.labels << [10, 710, args.gtk.current_framerate, 255, 255, 255]
end
