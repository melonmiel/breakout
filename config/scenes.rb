Engine::Game.configure do |config|
  config.scene :main_menu, MainMenuController.new
  config.scene :levels, LevelsController.new
end
