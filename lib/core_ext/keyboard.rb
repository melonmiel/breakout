module GTK
  class Keyboard
    def key_press(key)
      self.key_down.send(key) || self.key_held.send(key)
    end
  end
end
