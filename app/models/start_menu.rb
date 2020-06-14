class StartMenu < Engine::Model
  attr_accessor :menu_items

  def initialize
    @menu_items = [
      new_game_menu_item,
      quit_menu_item,
    ]
  end

  def new_game_menu_item
    @new_game_menu_item ||= MenuItem.new("NEW GAME", y: Viewport.vcenter(0), selected: true)
  end

  def quit_menu_item
    @quit_menu_item ||= MenuItem.new("QUIT", y: Viewport.vcenter(150))
  end

  def tick
    start_game
    quit_game
    cycle_menu_items
    menu_items.each(&:tick)
  end

  def start_game
    return unless new_game_menu_item.selected? && $args.inputs.keyboard.key_down.enter

    $args.state.screen = :level
  end

  def quit_game
    return unless quit_menu_item.selected? && $args.inputs.keyboard.key_down.enter

    exit
  end

  def cycle_menu_items
    move_up
    move_down
  end

  def move_up
    return unless $args.inputs.keyboard.key_down.up

    move(-1)
  end

  def move_down
    return unless $args.inputs.keyboard.key_down.down

    move(+1)
  end

  def move(offset)
    selected_menu_item = menu_items.find(&:selected?)
    next_item_index = menu_items.index(selected_menu_item) + offset

    return if next_item_index < 0 || next_item_index >= menu_items.size

    menu_items.each(&:unselect!)
    next_item = menu_items[next_item_index]
    next_item.select!
  end
end
