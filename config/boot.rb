require "lib/engine.rb"
require "config/colors.rb"

Engine.autoload do
  require "app/controllers/game_controller.rb"
  require "app/effects/ossilator.rb"
  require "app/labels/header.rb"
  require "app/layers/background_layer.rb"
  require "app/models/ball.rb"
  require "app/models/brick_layout.rb"
  require "app/models/brick.rb"
  require "app/models/menu.rb"
  require "app/models/menu/option.rb"
  require "app/models/menu/setting.rb"
  require "app/models/paddle.rb"
  require "app/screens/death_screen.rb"
  require "app/screens/level_screen.rb"
  require "app/screens/pause_screen.rb"
  require "app/screens/settings_screen.rb"
  require "app/screens/start_screen.rb"
end

Engine.configure do |config|
  # Metadata
  config.title = "Breakout"

  # Initializes default game settings
  config.settings do |settings|
    settings.sound = true
    settings.music = true
    settings.difficulty = "normal"
  end

  # Initializes any state you want the game to start with
  # FIXME: Must be declared after `settings` to overwrite loaded state
  config.screen = :start
end
