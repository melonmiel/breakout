class LevelsController < Engine::Controller
  attr_reader :levels

  def initialize
    @levels = List.new(Level01.new, Level02.new, Level03.new, Level04.new)
  end

  def boot
    play_song("level.ogg") if Engine::Settings.enabled?(:music)
    $args.state.paused = false
    reset
  end

  def tick
    complete_level! if current_level.completed?

    on_key_down(:space) do
      return level_screen.start unless paused? || level_screen.started?

      paused? ? resume_game : pause_game
    end

    current_screen.tick unless paused?
  end

  def render
    current_screen.render
    pause_indicator.render if paused?
  end

  def play(reset: false)
    level_screen.reset if reset
    paint(level_screen)
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
    level_screen.boot(level: current_level)
    paint(level_screen)
  end

  def quit
    exit
  end

  def complete_level!
    levels.next
    level_screen.boot(level: current_level)
    paint(win_screen)
  end

  def current_level
    levels.current
  end

  def die
    $args.state.health -= 1
    if dead?
      $args.state.score = 0
      $args.state.health = 3
      paint(death_screen)
    else
      play(reset: true)
    end
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

  def dead?
    $args.state.health < 1
  end

  def paused?
    $args.state.paused
  end

  def pause_indicator
    @pause_indicator ||= Engine::Label.new(x: Viewport.xcenter, y: Viewport.ycenter + 32, text: "GAME PAUSED", alignment: 1, size: 32, color: Colors.text, font: font_path("RocketRinder.ttf"))
  end
end
