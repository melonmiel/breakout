class ColorPalette
  # https://coolors.co/ffab26-ff7926-ea2056-5016bc-2d11ad
  BRIGHT_YELLOW_CRAYOLA = [255, 171, 38].freeze
  PUMPKIN = [255, 121, 38].freeze
  AMARANTH = [234, 32, 86].freeze
  # PURPLE = [80, 22, 188].freeze
  TRYPAN_BLUE = [45, 17, 173].freeze

  # https://coolors.co/f72585-7209b7-3a0ca3-4361ee-4cc9f0
  FLICKR_PINK = [247, 37, 133].freeze
  FLICKR_PURPLE = [114, 9, 183].freeze
  TRYPAN_BLUE = [58, 12, 163].freeze
  ULTRAMARINE_BLUE = [67, 97, 238].freeze
  VIVID_SKY_BLUE = [76, 201, 240].freeze

  # Dracula Theme
  DRACULA_BACKGROUND = [40, 42, 54].freeze
  DRACULA_LINE = [68, 71, 90].freeze
  DRACULA_FOREGROUND = [248, 248, 242].freeze
  DRACULA_CYAN = [139, 233, 253].freeze
  DRACULA_GREEN = [80, 250, 123].freeze
  DRACULA_ORANGE = [255, 184, 108].freeze
  DRACULA_PINK = [255, 121, 198].freeze
  DRACULA_PURPLE = [189, 147, 249].freeze
  DRACULA_RED = [255, 85, 85].freeze
  DRACULA_YELLOW = [241, 250, 140].freeze

  # https://coolors.co/6823cf-6002ed-991295-c93ac0-f030a3
  FRENCH_VIOLET = [104, 35, 207];
  HAN_PURPLE = [96, 2, 237];
  DARK_MAGENTA = [153, 18, 149];
  STEEL_PINK = [201, 58, 192];
  FROSTBITE = [240, 48, 163];

  def background(variant = :default)
    case variant
    when :default
      DRACULA_BACKGROUND
    when :paper
      [*DRACULA_BACKGROUND, 0.54]
    else
      raise ArgumentError, "Unknown variant '#{variant}'"
    end
  end

  def foreground(variant = :primary)
    case variant
    when :primary
      DRACULA_FOREGROUND
    when :secondary
      [*DRACULA_FOREGROUND, 0.7]
    when :disabled
      [*DRACULA_FOREGROUND, 0.5]
    else
      raise ArgumentError, "Unknown variant '#{variant}'"
    end
  end

  def text(variant = :primary)
    case variant
    when :primary
      DRACULA_FOREGROUND
    when :secondary
      [*DRACULA_FOREGROUND, 0.7]
    when :disabled
      [*DRACULA_FOREGROUND, 0.5]
    else
      raise ArgumentError, "Unknown variant '#{variant}'"
    end
  end

  def line
    DRACULA_LINE
  end

  def cyan(variant = :primary)
    case variant
    when :primary then VIVID_SKY_BLUE
    when :secondary then ULTRAMARINE_BLUE
    else
      raise ArgumentError, "Unknown variant '#{variant}'"
    end
  end

  def green
    DRACULA_GREEN
  end

  def orange
    PUMPKIN
  end

  def pink(variant = :primary)
    case variant
    when :primary then FROSTBITE
    when :secondary then STEEL_PINK
    else
      raise ArgumentError, "Unknown variant '#{variant}'"
    end
  end

  def magenta
    DARK_MAGENTA
  end

  def purple
    HAN_PURPLE
  end

  def red
    FLICKR_PINK
  end

  def yellow
    # YELLOW
    BRIGHT_YELLOW_CRAYOLA
  end

  class << self
    def method_missing(*color)
      new.send(*color)
    end
  end
end
