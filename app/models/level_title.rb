class LevelTitle
  include Engine::Assets

  attr_reader :label, :container

  def initialize(title)
    @label = Engine::Label.new(text: title, size: 6, alignment: 1, color: Colors.background, font: font_path("VerminVibes1989Regular.ttf"))
  end

  def boot(container:)
    @container = container
    label.x = container.xcenter
    label.y = container.top.y - 20
  end

  def render
    label.render
  end
end
