class Engine
  module Selectable
    attr_accessor :selected, :on_select

    def select!
      @selected = true
      self
    end

    def unselect!
      @selected = false
      self
    end

    def selected?
      selected
    end
  end
end
