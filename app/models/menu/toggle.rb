class Menu
  # A Toggle is a menu item that acts as a submenu with 2 options
  class Toggle < Option
    include Engine::Input

    attr_accessor :setting

    def initialize(setting, args = {})
      @setting = setting
      args[:x] ||= container.left.x
      args[:alignment] ||= 0
      super(args)
    end

    def tick
      return unless selected?

      on_keys(:left, :right, &on_select)
    end

    def render
      super
      on_label.render
      off_label.render
    end

    def on_select
      Proc.new do
        toggle!
        play_sound
      end
    end

    def on_label
      @on_label ||= Option.new(text: "ON", y: y, x: (container.right.x - 150), alignment: 2, selected: Settings.enabled?(setting), ossilate: false) do
        Settings.enable(setting)
      end
    end

    def off_label
      @off_label ||= Option.new(text: "OFF", y: y, x: container.right.x, alignment: 2, selected: Settings.disabled?(setting), ossilate: false) do
        Settings.disable(setting)
      end
    end

    def toggle!
      Settings.toggle(setting)
      on_label.selected = !on_label.selected
      off_label.selected = !off_label.selected
    end

    def play_sound
      $args.outputs.sounds << "app/assets/sounds/select.wav" if Settings.enabled?(:sound)
    end

    def container
      @container ||= Engine::Container.new(x: (1280-960)/2, y: y, width: 960, height: 100)
    end
  end
end
