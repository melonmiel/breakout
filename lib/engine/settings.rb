module Engine
  class Settings
    class << self
      def add_setting(key, default)
        settings[key] = default
      end

      def enable(key)
        settings[key] = true
      end

      def disable(key)
        settings[key] = false
      end

      def toggle(key)
        settings[key] = !settings[key]
      end

      def enabled?(key)
        settings[key]
      end

      def disabled?(key)
        !settings[key]
      end

      private

      def settings
        $args.state.settings
      end
    end
  end
end

# Initialize Settings
$args&.state&.settings = {}
