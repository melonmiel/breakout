# The one with vertical pillars
class Level03 < Level
  def paint
    COLUMNS.times.each do |column|
      # Skip 1 out of 3 columns
      next if column % 3 == 2

      ROWS.times.each do |row|
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
      Colors.pink(:primary),
      Colors.pink(:secondary),
      Colors.red,
      Colors.cyan(:secondary),
      Colors.cyan(:primary),
    ]
  end
end
