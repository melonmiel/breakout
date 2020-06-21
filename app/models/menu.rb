class Menu
  include Engine::Input

  attr_accessor :options, :margin, :offset

  def initialize(margin: 75, offset: 0)
    @options = []
    @margin = margin
    @offset = offset
  end

  def tick
    on_key(:up) { move_cursor(-1) }
    on_key(:down) { move_cursor(+1) }
    on_key(:enter) { selected_option.on_select.call }
    options.each(&:tick)
  end

  def render
    options.each(&:render)
  end

  def add_option(label, &block)
    args = {}
    args[:y] = Viewport.ycenter - (offset + options.length * margin)
    args[:selected] = (options.length == 0)
    args[:on_select] = block
    args[:text] = label
    option = Option.new(args)
    options << option
  end

  def add_toggle(key, args = {})
    args[:y] ||= Viewport.ycenter - (offset + options.length * margin)
    args[:selected] ||= (options.length == 0)
    option = Toggle.new(key, args)
    options << option
  end

  def selected_option
    options.find(&:selected?)
  end

  def move_cursor(offset)
    next_item_index = options.index(selected_option) + offset

    return if next_item_index < 0 || next_item_index >= options.length

    options.each(&:unselect!)
    next_item = options[next_item_index]
    next_item.select!
    play_sound
  end

  def play_sound
    return unless Settings.enabled?(:sound)

    $args.outputs.sounds << "app/assets/sounds/select.wav"
  end
end
