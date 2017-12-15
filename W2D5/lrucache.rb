class LRUCache
  def initialize
    @array = []
  end

  def count
    @array.size
  end

  def add(el)
    if !@array.include?(el)
      @array.delete(el)
    end
    if count >= 5
      @array.shift
    end
    @array << el
  end

  def show
    @array
  end

  private
end

# test
cache = LRUCache.new
cache.add('A')
cache.add('B')
cache.add('C')
cache.add('D')
cache.add('E')
cache.add('A')
cache.add('F')

p cache.show
