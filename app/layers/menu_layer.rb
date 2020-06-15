class MenuLayer
  class << self
    def render(menu)
      menu.menu_items.each do |menu_item|
        $args.outputs.labels << [Viewport.xcenter(0), menu_item.y, menu_item.label, 16, 1, *menu_item.color, menu_item.alpha, menu_item.font]
      end
    end
  end
end
