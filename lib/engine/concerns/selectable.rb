module Engine
  module Selectable
    attr_accessor :selected, :on_select

    def select!
      @selected = true
    end

    def unselect!
      @selected = false
    end

    def selected?
      selected
    end
  end
end
