module Engine
  module Assets
    def font_path(filename)
      "app/assets/fonts/#{filename}"
    end

    def sound_path(filename)
      "app/assets/sounds/#{filename}"
    end

    def song_path(filename)
      "app/assets/songs/#{filename}"
    end

    def play_sound(sound)
      $args.outputs.sounds << sound_path(sound)
    end

    def play_music(song)
      $args.outputs.sounds << song_path(song)
    end

    def stop_music
      $args.outputs.sounds << song_path("silence.ogg")
    end
  end
end
