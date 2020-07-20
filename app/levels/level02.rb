# The one that skips rows
class Level02 < Level
  def initialize_bricks
    @bricks = []
    COLUMNS.times.each do |column|
      ROWS.times.each do |row|
        # Skip 1 out of 2 rows
        next if row % 2 == 1

        color = colors[row] || Colors.green
        @bricks << Brick.new(position_x(column), position_y(row), color: color)
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
