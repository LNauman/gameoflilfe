class Cell
  def initialize
    @alive = false
  end

  def alive?
    @alive
  end

  def resurrect!
    @alive = true
  end

  def kill!
    @alive = false
  end

end