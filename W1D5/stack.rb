class Stack
  def initialize
    @arr = []
  end

  def add(el)
    @arr << el
  end

  def remove
    @arr.pop
  end

  def show
    @arr.last
  end
end
