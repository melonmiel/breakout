class Engine
  class Error < StandardError; end

  class << self
    # Useful to require your game files
    # Ensures Engine is loaded before the game
    def autoload(&block)
      yield
    end

    # Persists state to file
    def save
      $gtk.serialize_state(state_filename, $gtk.args.state)
    end

    # Loads state if it state dump file exists
    # Otherwise it initializes state using block values
    def configure(&block)
      yield(self)
    end

    # Configure state-persisted settings for your game
    #
    # ```
    # Engine.settings do |config|
    #   config.sound = true
    # end
    # ```
    def settings(&block)
      yield($gtk.args.state) # Initializes state with default values
      load_state # Overwrites default values with persisted state
    end

    def title=(title)
      @@title = title
    end

    def title
      @@title || "MyGame"
    end

    private

    def load_state
      if state = $gtk.deserialize_state(state_filename)
        $gtk.args.state = state
      end
    end

    def state_filename
      @state_filename ||= begin
        filename = title.downcase.tr(" ", "_").tr("-", "_")
        "#{filename}.txt"
      end
    end

    def method_missing(method, *args)
      $gtk.args.state.send(method, *args)
    end
  end
end

# Core Extensions
require "lib/core_ext/keyboard.rb"
require "lib/core_ext/list.rb"

# Extensions
require "lib/engine/input.rb"
require "lib/engine/collision.rb"

# Modules
require "lib/engine/concerns/assets.rb"
require "lib/engine/concerns/selectable.rb"

# Core Objects
require "lib/engine/controller.rb"
require "lib/engine/game.rb"
require "lib/engine/label.rb"
require "lib/engine/line.rb"
require "lib/engine/model.rb"
require "lib/engine/screen.rb"

# Helpers
require "lib/engine/container.rb"
require "lib/engine/edge.rb"
require "lib/engine/settings.rb"
require "lib/engine/viewport.rb"
