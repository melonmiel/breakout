class Menu
  include Engine::Assets
  include Engine::Input

  attr_accessor :options, :margin, :offset

  def initialize(margin: 75, offset: 0, &block)
    @options = List.new
    @margin = margin
    @offset = offset

    setup_options(&block)
  end

  def setup_options(&block)
    yield(self)
  end

  def tick
    on_key_down(:up, :w) do
      options.previous
      play_sound("select.wav") if Engine::Settings.enabled?(:sound)
    end
    on_key_down(:down, :s) do
      options.next
      play_sound("select.wav") if Engine::Settings.enabled?(:sound)
    end
    options.each(&:tick)
  end

  def render
    options.each(&:render)
  end

  def add_option(args = {}, &block)
    args = default_option_args.merge(args)
    option = Option.new(args, &block)
    options << option
  end

  def add_setting(setting, args = {}, &block)
    args = default_option_args.merge(args)
    option = Setting.new(setting, args, &block)
    options << option
  end

  def default_option_args
    {
      y: (Viewport.ycenter - (offset + options.length * margin)),
      selected: (options.length == 0),
    }
  end
end
