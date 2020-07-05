class Engine
  module Input
    def on_key_down(*keys, &block)
      on_keyboard_input(:key_down, *keys, &block)
    end

    def on_key_held(*keys, &block)
      on_keyboard_input(:key_held, *keys, &block)
    end

    def on_key_up(*keys, &block)
      on_keyboard_input(:key_up, *keys, &block)
    end

    def key_down?(*keys)
      key_active?(*keys, :key_down)
    end

    def key_held?(*keys)
      key_active?(*keys, :key_held)
    end

    def key_up?(*keys)
      key_active?(*keys, :key_up)
    end

    private

    def on_keyboard_input(state, *keys, &block)
      return unless key_active?(*keys, state)

      yield if block_given?
    end

    def key_active?(*keys, state)
      keys.any? { |key| $args.inputs.keyboard.send(state).send(key) }
    end
  end
end
