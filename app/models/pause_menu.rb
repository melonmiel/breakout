class PauseMenu < Engine::Menu
  attr_accessor :menu_items

  def initialize
    @menu_items = [
      resume_menu_item,
      back_to_main_menu_item,
      quit_menu_item,
    ]
  end

  def resume_menu_item
    @resume_menu_item ||= MenuItem.new("RESUME", y: Viewport.vcenter(0), selected: true)
  end

  def back_to_main_menu_item
    @back_to_main_menu_item ||= MenuItem.new("BACK TO MAIN MENU", y: Viewport.vcenter(150))
  end

  def quit_menu_item
    @quit_menu_item ||= MenuItem.new("QUIT", y: Viewport.vcenter(300))
  end

  def tick
    resume_game
    back_to_main_menu
    quit_game
    cycle(menu_items)
    menu_items.each(&:tick)
  end

  def resume_game
    return unless resume_menu_item.selected? && $args.inputs.keyboard.key_down.enter

    $args.state.screen = :level
  end

  def back_to_main_menu
    return unless back_to_main_menu_item.selected? && $args.inputs.keyboard.key_down.enter

    resume_menu_item.select!
    back_to_main_menu_item.unselect!
    GameController.reset!
  end

  def quit_game
    return unless quit_menu_item.selected? && $args.inputs.keyboard.key_down.enter

    exit
  end
end
