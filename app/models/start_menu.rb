class StartMenu < Engine::Model
  attr_accessor :alpha

  def initialize
    @alpha = 255
  end

  def tick
    start_game
    set_alpha
  end

  def start_game
    return unless game_starts?

    $args.state.screen = :level
  end

  def set_alpha
    @alpha = ($args.tick_count * 3) % 255
  end

  def game_starts?
    $args.inputs.keyboard.key_down.space
  end
end
