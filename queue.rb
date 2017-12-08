class Queue
  def initialize
    @arr = []

  end

  def enqueue(val)
    @arr.unshift(val)
  end

  def dequeue
    @arr.pop
  end

  def show
    @arr.last
  end
end
