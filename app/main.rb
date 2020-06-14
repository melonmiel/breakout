require "lib/autoload.rb"
require "lib/engine.rb"

$engine = Engine.new
$game = GameController.new

def tick(args)
  $engine.args = args
  $game.tick
end
