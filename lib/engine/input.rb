module Engine
  module Input
    def on_key(key, &block)
      return unless $args.inputs.keyboard.key_down.send(key)

      yield if block_given?
    end
  end
end
