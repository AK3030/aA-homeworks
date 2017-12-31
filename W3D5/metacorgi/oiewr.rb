class Thing
  def initialize
    @hi = 1
    Thing.stuff
    # define_method(:hi) {p "stuff"}
  end

  define_method(:hey) {p "hey"}

  def self.stuff

  end

  # def whatever
  #   define_method(:hey) {p "hey"}
  # end

end

stuff = Thing.new
Thing.hey
