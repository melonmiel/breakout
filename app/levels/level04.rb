# The one where bricks are random
class Level04 < Level
  class BrickColor
    include Engine::Selectable

    attr_reader :value

    def initialize(value)
      @value = value
    end
  end

  attr_reader :colors

  def initialize
    @colors = List.new(BrickColor.new(Colors.magenta),
                       BrickColor.new(Colors.pink(:primary)),
                       BrickColor.new(Colors.pink(:secondary)),
                       BrickColor.new(Colors.red),
                       BrickColor.new(Colors.cyan(:secondary)),
                       BrickColor.new(Colors.cyan(:primary)),
                       BrickColor.new(Colors.green))
    super
  end

  def paint
    COLUMNS.times.each do |column|
      ROWS.times.each do |row|
        # Skip 1 out of 2 bricks
        next if rand > 0.5

        color = colors.current
        colors.next

        x = left_edge + (column * Brick::WIDTH)
        y = top_edge - (row * Brick::HEIGHT)
        @bricks << Brick.new(x, y, color: color.value)
      end
    end
  end
end
