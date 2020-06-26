class Engine
  module Settings
    class << self
      def enable(key)
        set(key, true)
      end

      def enable!(key)
        set!(key, true)
      end

      def disable(key)
        set(key, false)
      end

      def disable!(key)
        set!(key, false)
      end

      def toggle(key)
        set(key, !get(key))
      end

      def toggle!(key)
        set!(key, !get(key))
      end

      def set(key, value)
        raise ArgumentError, "Can't serialize symbols. Considering using strings instead." if value.is_a?(Symbol)

        state.send("#{key}=", value)
      end

      def set!(key, value)
        set(key, value)
        Engine.save
      end

      def enabled?(key)
        get(key)
      end

      def disabled?(key)
        !get(key)
      end

      def get(key)
        state.send(key)
      end

      def current?(key, value)
        get(key) == value
      end

      private

      def state
        $args.state
      end
    end
  end
end
