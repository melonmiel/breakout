class Engine
  attr_accessor :args

  def initialize
    @args = nil
  end

  def keyboard
    args.inputs.keyboard
  end

  def state
    args.state
  end
end
