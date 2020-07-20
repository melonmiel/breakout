class LevelsController < Engine::Controller
  attr_reader :levels

  def initialize
    @levels = List.new(Level01.new, Level02.new, Level03.new, Level04.new)
  end

  def boot
    play_song("level.ogg") if Engine::Settings.enabled?(:music)
    $args.state.paused = false
    $args.state.score = 0
    play
  end

  def tick
    complete_level! if current_level.completed?

    on_key_down(:space) do
      paused? ? resume_game : pause_game
    end

    current_screen.tick unless paused?
  end

  def render
    current_screen.render
    pause_indicator.render if paused?
  end

  def play
    paint(level_screen, level: current_level)
  end

  def resume_game
    play_sound("resume.wav") if Engine::Settings.enabled?(:sound)
    $args.state.paused = false
  end

  def pause_game
    play_sound("pause.wav") if Engine::Settings.enabled?(:sound)
    $args.state.paused = true
  end

  def reset
    @level_screen = LevelScreen.new(self)
    paint(@level_screen, level: current_level)
  end

  def quit
    exit
  end

  def complete_level!
    levels.next
    paint(win_screen)
  end

  def current_level
    levels.current
  end

  def die
    paint(death_screen)
  end

  def render_menu
    play_sound("pause.wav") if Engine::Settings.enabled?(:sound)
    paint(in_game_menu_screen)
  end

  def back_to_main_menu
    Engine::Game.render(:main_menu)
  end

  private

  def level_screen
    @level_screen ||= LevelScreen.new(self)
  end

  def death_screen
    @death_screen ||= DeathScreen.new(self)
  end

  def in_game_menu_screen
    @in_game_menu_screen ||= InGameMenuScreen.new(self)
  end

  def win_screen
    @win_screen ||= WinScreen.new(self)
  end

  def paused?
    $args.state.paused
  end

  def pause_indicator
    @pause_indicator ||= Engine::Label.new(x: Viewport.xcenter, y: Viewport.ycenter + 32, text: "GAME PAUSED", alignment: 1, size: 32, color: Colors.text, font: font_path("RocketRinder.ttf"))
  end
end
