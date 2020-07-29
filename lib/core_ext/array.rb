class Array
  def sample
    at((rand * length).to_i)
  end
end
