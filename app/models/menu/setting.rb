class Menu
  # A Setting is a menu item for a game setting
  class Setting < Option
    include Engine::Assets
    include Engine::Input
    include Engine::Selectable

    attr_accessor :setting, :options

    def initialize(setting, args = {}, &block)
      @setting = setting
      @options = List.new
      args[:x] ||= container.left.x
      args[:alignment] ||= 0
      super(args)

      setup_options(&block)
    end

    def setup_options(&block)
      yield(self)
    end

    def tick
      return unless selected?

      on_key(:left, &cycle(-1))
      on_keys(:right, :enter, &cycle(+1))
    end

    def render
      super
      options.current&.render
    end

    def add_option(value, args = {}, &on_select)
      args = args.merge(y: y, size: size, font: font)
      args[:x] ||= container.right.x
      args[:alignment] ||= 2
      args[:color] ||= ColorPalette.text
      args[:value] ||= value
      args[:selected] ||= Settings.current?(setting, value)
      args[:ossilate] ||= false
      args[:on_select] ||= on_select || Proc.new { }
      options << Option.new(args, &cycle)
    end

    def cycle(offset = +1)
      Proc.new do
        options.cycle(offset)
        Settings.set(setting, options.current.value)
        play_sound(:select) if Settings.enabled?(:sound)
        options.current.on_select.call
      end
    end

    def container
      @container ||= Engine::Container.new(x: (1280-960)/2, y: y, width: 960, height: 100)
    end
  end
end
