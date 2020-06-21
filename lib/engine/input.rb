module Engine
  module Input
    def on_key(key, &block)
      return unless $args.inputs.keyboard.key_down.send(key)

      yield if block_given?
    end

    def on_keys(*keys, &block)
      keys.each do |key|
        on_key(key, &block)
      end
    end
  end
end
