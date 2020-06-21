class String
  def underscore
    self
      .downcase
      .tr(" ", "_")
      .tr("-", "_")
  end
end
