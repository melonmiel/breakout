class Level
  include Engine::Selectable

  PADDING_TOP = 100
  COLUMNS = 14
  ROWS = 6

  attr_reader :bricks, :container
  attr_reader :booted
  alias_method :booted?, :booted

  def boot(container:)
    @container = container
    initialize_bricks
    @booted = true
  end

  def tick
    return unless booted?

    bricks.reject!(&:exploded?)
  end

  def render
    return unless booted?

    bricks.each(&:render)
  end

  def completed?
    booted? && bricks.empty?
  end

  def position_x(column)
    container.xcenter - (COLUMNS * Brick::WIDTH / 2) + (column * Brick::WIDTH)
  end

  def position_y(row)
    container.top.y - PADDING_TOP - (row * Brick::HEIGHT)
  end
end
