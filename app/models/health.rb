class Health
  include Engine::Assets

  attr_reader :container, :icon, :label

  def initialize
    @icon = Engine::Sprite.new(width: 32, height: 32, sprite_path: sprite_path("heart.png"))
    @label = Engine::Label.new(text: lives_left, size: 6, alignment: 2, color: Colors.foreground, font: font_path("VerminVibes1989Regular.ttf"))
  end

  def boot(container:)
    @container = container
    icon.x = container.right.x - 140
    icon.y = container.top.y - 50
    label.x = container.right.x- 20
    label.y = container.top.y - 20
  end

  def tick
    label.text = lives_left
  end

  def render
    icon.render if icon.valid?
    label.render
  end

  def lives_left
    "x #{$args.state.health.to_s.rjust(2, "0")}"
  end
end
