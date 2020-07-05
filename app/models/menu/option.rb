class Menu
  class Option < Engine::Label
    include Engine::Input
    include Engine::Selectable

    attr_accessor :ossilate, :on_enter, :value

    alias :ossilate? :ossilate

    def initialize(args = {}, &on_enter)
      @x = args.fetch(:x, Viewport.xcenter)
      @y = args.fetch(:y, Viewport.ycenter)
      @text = args.fetch(:text)
      @size = args.fetch(:size, 16)
      @alignment = args.fetch(:alignment, 1)
      @color = args.fetch(:color, nil)
      @font = args.fetch(:font, "app/assets/fonts/VerminVibes1989Regular.ttf")

      @value = args.fetch(:value, nil)
      @selected = args.fetch(:selected, false)
      @ossilate = args.fetch(:ossilate, true)
      @on_enter = on_enter || Proc.new { }
      @on_select = args[:on_select] || Proc.new { }
    end

    def tick
      return unless selected?

      on_key_down(:enter, &on_enter)
    end

    def color
      @color || (selected? ? Colors.cyan : Colors.text)
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
