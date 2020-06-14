class MenuItem < Engine::Model
  SELECTED_COLOR = [255, 0, 255].freeze
  BLANK_COLOR = [255, 255, 255].freeze
  BLINK_SPEED = 2.5

  attr_accessor :label, :color, :selected

  def initialize(label, y: 0, selected: false)
    @label = label
    @y = y
    @selected = selected
    @color = set_color
    @fade = :in
  end

  def select!
    @selected = true
  end

  def unselect!
    @selected = false
  end

  def selected?
    selected
  end

  def tick
    set_color
  end

  def set_color
    @color = selected ? [*SELECTED_COLOR, alpha] : BLANK_COLOR
  end

  def alpha
    @fade = @fade == :in ? :out : :in if blink_gauge == 0
    255 - (@fade == :out ? blink_gauge : 100-blink_gauge)
  end

  def blink_gauge
    ($args.tick_count * BLINK_SPEED) % 100
  end
end
