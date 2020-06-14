require "lib/autoload.rb"

def tick(args)
  $args = args
  GameController.tick
end
