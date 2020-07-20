class Level
  include Engine::Selectable

  PADDING_TOP = 100
  COLUMNS = 14
  ROWS = 6

  attr_reader :bricks, :container

  def setup(container)
    @container = container
    initialize_bricks
  end

  def tick
    bricks.reject!(&:exploded?)
  end

  def render
    bricks.each(&:render)
  end

  def completed?
    bricks.empty?
  end

  def position_x(column)
    container.xcenter - (COLUMNS * Brick::WIDTH / 2) + (column * Brick::WIDTH)
  end

  def position_y(row)
    container.top.y - PADDING_TOP - (row * Brick::HEIGHT)
  end
end
