class Score
  include Engine::Assets

  attr_reader :label, :container

  def initialize
    @label = Engine::Label.new(text: padded_score, size: 6, alignment: 0, color: Colors.background, font: font_path("VerminVibes1989Regular.ttf"))
  end

  def boot(container:)
    @container = container
    label.x = container.x + 20
    label.y = container.top.y - 20
  end

  def tick
    label.text = padded_score
  end

  def render
    label.render
  end

  def padded_score
    $args.state.score.to_s.rjust(8)
  end
end
