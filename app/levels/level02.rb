# The one that skips rows
class Level02 < Level
  def paint
    COLUMNS.times.each do |column|
      ROWS.times.each do |row|
        # Skip 1 out of 2 rows
        next if row % 2 == 1

        color = colors[row] || Colors.green
        x = left_edge + (column * Brick::WIDTH)
        y = top_edge - (row * Brick::HEIGHT)
        @bricks << Brick.new(x, y, color: color)
      end
    end
  end

  private

  def colors
    [
      Colors.magenta,
      Colors.red,
      Colors.cyan(:primary),
    ]
  end
end
