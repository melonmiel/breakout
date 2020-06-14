require "lib/autoload.rb"

$game = GameController.new

def tick(args)
  $game.tick(args)
end
