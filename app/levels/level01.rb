# The one with the full layout
class Level01 < Level
  def paint
    COLUMNS.times.each do |column|
      ROWS.times.each do |row|
        color = colors[row] || Colors.green
        x = left_edge + (column * Brick::WIDTH)
        y = top_edge - (row * Brick::HEIGHT)
        @bricks << Brick.new(x, y, color: color)
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
end
