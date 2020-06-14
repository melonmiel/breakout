class ColorPalette
  # https://coolors.co/ffab26-ff7926-ea2056-5016bc-2d11ad
  # BRIGHT_YELLOW_CRAYOLA = [255, 171, 38].freeze
  # PUMPKIN = [255, 121, 38].freeze
  # AMARANTH = [234, 32, 86].freeze
  # PURPLE = [80, 22, 188].freeze
  # TRYPAN_BLUE = [45, 17, 173].freeze

  # Dracula Theme
  BACKGROUND = [40, 42, 54].freeze
  LINE = [68, 71, 90].freeze
  FOREGROUND = [248, 248, 242].freeze
  CYAN = [139, 233, 253].freeze
  GREEN = [80, 250, 123].freeze
  ORANGE = [255, 184, 108].freeze
  PINK = [255, 121, 198].freeze
  PURPLE = [189, 147, 249].freeze
  RED = [255, 85, 85].freeze
  YELLOW = [241, 250, 140].freeze

  class << self
    def background(variant = :default)
      case variant
      when :default
        BACKGROUND
      when :paper
        [*BACKGROUND, 0.54]
      else
        raise ArgumentError, "Unknown variant '#{variant}'"
      end
    end

    def foreground(variant = :primary)
      case variant
      when :primary
        FOREGROUND
      when :secondary
        [*FOREGROUND, 0.7]
      when :disabled
        [*FOREGROUND, 0.5]
      else
        raise ArgumentError, "Unknown variant '#{variant}'"
      end
    end

    def text(variant = :primary)
      case variant
      when :primary
        FOREGROUND
      when :secondary
        [*FOREGROUND, 0.7]
      when :disabled
        [*FOREGROUND, 0.5]
      else
        raise ArgumentError, "Unknown variant '#{variant}'"
      end
    end

    def line
      LINE
    end

    def cyan
      CYAN
    end

    def green
      GREEN
    end

    def orange
      ORANGE
    end

    def pink
      PINK
    end

    def purple
      PURPLE
    end

    def red
      RED
    end

    def yellow
      YELLOW
    end
  end
end
