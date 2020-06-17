module Engine
  module Interaction
    def on_key(key, &block)
      return unless $args.inputs.keyboard.key_down.send(key)

      yield if block_given?
    end
  end
end
