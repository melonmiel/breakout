class StartMenu < Engine::Menu
  attr_accessor :menu_items

  def initialize
    @menu_items = [
      new_game_menu_item,
      quit_menu_item,
    ]
  end

  def new_game_menu_item
    @new_game_menu_item ||= MenuItem.new("NEW GAME", y: Viewport.vcenter(50), selected: true)
  end

  def quit_menu_item
    @quit_menu_item ||= MenuItem.new("QUIT", y: Viewport.vcenter(200))
  end

  def tick
    start_game
    quit_game
    cycle(menu_items)
  end

  def render
    menu_items.each do |menu_item|
      $args.outputs.labels << [Viewport.xcenter(0), menu_item.y, menu_item.label, 16, 1, *menu_item.color, menu_item.alpha, menu_item.font]
    end
  end

  def start_game
    return unless new_game_menu_item.selected? && $args.inputs.keyboard.key_down.enter

    $args.outputs.sounds << "app/assets/sounds/start-game.wav"
    $args.state.screen = :level
  end

  def quit_game
    return unless quit_menu_item.selected? && $args.inputs.keyboard.key_down.enter

    exit
  end
end
