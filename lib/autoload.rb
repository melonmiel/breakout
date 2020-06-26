require "lib/core_ext/keyboard.rb"
require "lib/core_ext/list.rb"
require "lib/core_ext/string.rb"

# Extensions
require "lib/engine/input.rb"
require "lib/engine/collision.rb"

# Modules
require "lib/engine/concerns/assets.rb"

# Core Objects
require "lib/engine/label.rb"
require "lib/engine/line.rb"
require "lib/engine/model.rb"
require "lib/engine/screen.rb"

# Helpers
require "lib/engine/container.rb"
require "lib/engine/edge.rb"
require "lib/engine/settings.rb"
require "lib/engine/viewport.rb"

# Application
require "app/assets/color_palette.rb"
require "app/controllers/game_controller.rb"
require "app/effects/ossilator.rb"
require "app/labels/header.rb"
require "app/labels/menu_item.rb"
require "app/layers/background_layer.rb"
require "app/models/ball.rb"
require "app/models/brick_layout.rb"
require "app/models/brick.rb"
require "app/models/menu.rb"
require "app/models/paddle.rb"
require "app/screens/death_screen.rb"
require "app/screens/level_screen.rb"
require "app/screens/pause_screen.rb"
require "app/screens/start_screen.rb"
require "app/settings.rb"
