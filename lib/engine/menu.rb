module Engine
  class Menu
    def cycle(menu_items)
      move_cursor_up(menu_items)
      move_cursor_down(menu_items)
    end

    def move_cursor_up(menu_items)
      return unless $args.inputs.keyboard.key_down.up

      move_cursor(-1, menu_items)
    end

    def move_cursor_down(menu_items)
      return unless $args.inputs.keyboard.key_down.down

      move_cursor(+1, menu_items)
    end

    def move_cursor(offset, menu_items)
      selected_menu_item = menu_items.find(&:selected?)
      next_item_index = menu_items.index(selected_menu_item) + offset

      return if next_item_index < 0 || next_item_index >= menu_items.size

      menu_items.each(&:unselect!)
      next_item = menu_items[next_item_index]
      next_item.select!
    end
  end
end
