# The one with vertical pillars
class Level03 < Level
  def initialize_bricks
    @bricks = []
    COLUMNS.times.each do |column|
      # Skip 1 out of 3 columns
      next if column % 3 == 2

      ROWS.times.each do |row|
        color = colors[row] || Colors.green
        @bricks << Brick.new(position_x(column), position_y(row), color: color)
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
