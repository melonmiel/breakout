class Menu
  class Option < Engine::Label
    attr_accessor :ossilate, :selected, :on_select

    alias :ossilate? :ossilate
    alias :selected? :selected

    def initialize(args = {}, &block)
      @x = args.fetch(:x, Viewport.xcenter)
      @y = args.fetch(:y, Viewport.ycenter)
      @text = args.fetch(:text)
      @size = args.fetch(:size, 18)
      @alignment = args.fetch(:alignment, 1)
      @font = args.fetch(:font, "app/assets/fonts/VerminVibes1989Regular.ttf")

      @selected = args.fetch(:selected, false)
      @on_select = args.fetch(:on_select, Proc.new { })
      @ossilate = args.fetch(:ossilate, true)
    end

    def select!
      @selected = true
    end

    def unselect!
      @selected = false
    end

    def color
      selected? ? ColorPalette.cyan : ColorPalette.text
    end

    def alpha
      selected? && ossilate? ? ossilator.value : 255
    end

    private

    def ossilator
      @ossilator ||= Effects::Ossilator.new(range: (150..255), interval: 5)
    end
  end
end
