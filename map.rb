class Map
  def initialize
    @arr = []
  end

  def assign(key, value)
    @arr << [key, value]
  end

  def lookup(key)
    @arr.each {|i| return i[1] if i[0] == key}
  end

  def remove(key)
    @arr.each {|i| @arr.delete(i) if i[0] == key}
    nil
  end

  def show
    return @arr
  end

end
