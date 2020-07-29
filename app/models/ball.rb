class Ball < Engine::Model
  DEFAULT_SIZE = 10
  POSITION_Y = 25
  ANGLE_TILT = 5
  SPEED_INCREMENT = 0.05

  STARTING_SPEEDS = {
    easy: 7.5,
    normal: 8.25,
    difficult: 10,
  }

  MAXIMUM_SPEEDS = {
    easy: 12,
    normal: 15,
    difficult: 18,
  }

  attr_accessor :angle, :speed, :x_velocity, :y_velocity

  def initialize(x: nil, y: nil)
    @x = x || Viewport.xcenter
    @y = y || POSITION_Y
    @width = DEFAULT_SIZE
    @height = DEFAULT_SIZE
    @color = Colors.foreground

    @speed = starting_speed
    @x_velocity = 1
    @y_velocity = [1, -1].sample # Random start left or right
    @angle = 45
  end

  def serialize
    super.merge(
      angle: angle,
      speed: speed,
      x_velocity: x_velocity,
      y_velocity: y_velocity,
    )
  end

  def travel!
    @x = next_x
    @y = next_y
  end

  def bounce_off(solid)
    case closest_side(solid)
    when :left, :right then bounce(direction: :horizontal)
    when :top, :bottom then bounce(direction: :vertical)
    end
  end

  def bounce(direction: nil)
    increase_speed
    flip_velocity(direction)
    tilt_angle
  end

  def trajectory
    Engine::Line.new(x: x, y: y, x2: next_x, y2: next_y)
  end

  private

  def increase_speed
    return if speed >= maximum_speed

    @speed += SPEED_INCREMENT
  end

  def flip_velocity(direction)
    case direction
    when :horizontal
      @x_velocity = -x_velocity
    when :vertical
      @y_velocity = -y_velocity
    else
      raise ArgumentError, "Wrong direction '#{direction}'"
    end
  end

  def tilt_angle
    factor = (0..ANGLE_TILT).sample
    factor = -factor if [true, false].sample
    @angle = @angle + factor
    @angle = 45 if @angle > 75 || @angle < 15
    @angle
  end

  def next_x
    @x + Math.cos(angle.to_radians) * x_velocity * speed
  end

  def next_y
    @y + Math.sin(angle.to_radians) * y_velocity * speed
  end

  def closest_side(solid)
    distances = {
      left: (x - solid.left).abs,
      right: (x - solid.right).abs,
      top: (y - solid.top).abs,
      bottom: (y - solid.bottom).abs,
    }
    distances = distances.sort_by { |_side, distance| distance }.to_h
    distances.keys.first
  end

  def starting_speed
    STARTING_SPEEDS.fetch(difficulty, 8.25)
  end

  def maximum_speed
    MAXIMUM_SPEEDS.fetch(difficulty, 12)
  end

  def difficulty
    Engine::Settings.get(:difficulty).to_sym
  end
end
