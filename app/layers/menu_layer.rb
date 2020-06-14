class MenuLayer
  class << self
    def render(menu)
      menu.menu_items.each do |menu_item|
        $args.outputs.labels << [Viewport.xcenter(0), menu_item.y, menu_item.label, 16, 1, *menu_item.color]
      end
    end
  end
end