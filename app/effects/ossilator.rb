module Effects
  class Ossilator
    attr_accessor :range, :interval

    def initialize(range:, interval: 12)
      @in = true
      @range = range
      @interval = interval
      @value = range.min
    end

    def value
      return @value unless ($args.tick_count % interval) == 0

      gauge = $args.tick_count % span
      @in = !@in if gauge == 0
      @value = @in ? range.min + gauge : range.min + span - gauge
      @value
    end

    def span
      @span ||= range.max - range.min
    end
  end
end
