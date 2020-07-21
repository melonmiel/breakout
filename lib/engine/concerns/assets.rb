class Engine
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

    def sprite_path(filename)
      "app/assets/sprites/#{filename}"
    end

    def play_sound(sound)
      $args.outputs.sounds << sound_path(sound)
    end

    def play_song(song)
      $args.outputs.sounds << song_path(song)
    end

    def stop_music
      $gtk.stop_music
    end
  end
end
