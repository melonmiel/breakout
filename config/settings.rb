Engine.configure do |config|
  # Metadata
  config.title = "Breakout"

  # Initializes default game settings
  config.settings do |settings|
    settings.sound = true
    settings.music = true
    settings.difficulty = "normal"
  end
end
