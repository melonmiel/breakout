class Level
  include Engine::Selectable

  PADDING_TOP = 100
  COLUMNS = 14
  ROWS = 6

  attr_reader :bricks

  def initialize
    @bricks = []
    paint
  end

  def tick
    bricks.reject!(&:exploded?)
  end

  def render
    bricks.each(&:render)
  end

  def reset
    @bricks = []
    paint
  end

  def paint
    raise NotImplementError, "You must define `paint`."
  end

  def completed?
    bricks.empty?
  end

  def left_edge
    @left_edge ||= Viewport.xcenter - (COLUMNS * Brick::WIDTH / 2)
  end

  def top_edge
    @top_edge ||= Viewport.height - PADDING_TOP
  end
end
