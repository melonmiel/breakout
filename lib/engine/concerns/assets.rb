module Engine
  module Assets
    def font_path(fontname)
      "app/assets/fonts/#{fontname}.ttf"
    end

    def sound_path(filename)
      "app/assets/sounds/#{filename}.wav"
    end

    def play_sound(reference)
      $args.outputs.sounds << sound_path(reference)
    end
  end
end
