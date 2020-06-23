class BrickLayout < Engine::Model
  PADDING_TOP = 100

  attr_accessor :rows, :columns, :bricks

  def initialize(rows:, columns:)
    @rows = rows
    @columns = columns
    @bricks = setup_bricks
  end

  def render
    bricks.each(&:render)
    bricks.reject!(&:exploded?)
  end

  def setup_bricks
    columns.times.flat_map do |column|
      rows.times.map do |row|
        color = colors[row] || ColorPalette.green
        x = left_edge + (column * Brick::WIDTH)
        y = top_edge - (row * Brick::HEIGHT)
        Brick.new(x, y, color: color)
      end
    end
  end

  def colors
    [
      ColorPalette.magenta,
      ColorPalette.pink(:primary),
      ColorPalette.pink(:secondary),
      ColorPalette.red,
      ColorPalette.cyan(:secondary),
      ColorPalette.cyan(:primary),
    ]
  end

  def left_edge
    @left_edge ||= Viewport.xcenter - (columns * Brick::WIDTH / 2)
  end

  def top_edge
    @top_edge ||= Viewport.height - PADDING_TOP
  end
end
