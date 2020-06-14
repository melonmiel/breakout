require "lib/autoload.rb"

$gtk.reset

def tick(args)
  $args = args
  GameController.tick
end
