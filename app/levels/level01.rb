# The one with the full layout
class Level01 < Level
  def initialize_bricks
    @bricks = []
    COLUMNS.times.each do |column|
      ROWS.times.each do |row|
        color = colors[row] || Colors.green
        @bricks << Brick.new(position_x(column), position_y(row), color: color)
      end
    end
  end

  def colors
    [
      Colors.magenta,
      Colors.pink(:primary),
      Colors.pink(:secondary),
      Colors.red,
      Colors.cyan(:secondary),
      Colors.cyan(:primary),
    ]
  end

  def title
    "Warm up"
  end
end
