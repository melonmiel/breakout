class BrickLayout < Engine::Model
  PADDING_TOP = 100
  COLORS = [
    ColorPalette.red,
    ColorPalette.pink,
    ColorPalette.orange,
    ColorPalette.yellow,
    ColorPalette.green,
    ColorPalette.cyan,
  ]

  attr_accessor :rows, :columns, :bricks

  def initialize(rows:, columns:)
    @rows = rows
    @columns = columns
    @bricks = setup_bricks
  end

  def setup_bricks
    columns.times.flat_map do |column|
      rows.times.map do |row|
        color = COLORS[row] || ColorPalette.green
        x = left_edge + (column * Brick::WIDTH)
        y = top_edge - (row * Brick::HEIGHT)
        Brick.new(x, y, color: color)
      end
    end
  end

  def left_edge
    @left_edge ||= Viewport.xcenter(columns * Brick::WIDTH)
  end

  def top_edge
    @top_edge ||= Viewport.height - PADDING_TOP
  end
end
