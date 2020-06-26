module Engine
  module Assets
    def font_path(filename)
      "app/assets/fonts/#{filename}"
    end

    def sound_path(filename)
      "app/assets/sounds/#{filename}"
    end

    def play_sound(reference)
      $args.outputs.sounds << sound_path(reference)
    end
  end
end
