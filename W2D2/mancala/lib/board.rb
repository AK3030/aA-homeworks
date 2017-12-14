class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new(4) {:stone}}
    @opponentcup = {name1=> 13, name2 => 6}
    @playercup = {name2=>13,name1=>6}
    @cups[6] = []
    @cups[13] = []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 || start_pos < 1

  end

  def make_move(start_pos, current_player_name)
    amnt = @cups[start_pos].length
    @cups[start_pos] = []
    i = 1
    ending_cup_idx = 0
    while i <= amnt
      current_pos = (i + start_pos) % 14
      if current_pos == @opponentcup[current_player_name]
        i+=1
        amnt+=1
        next
      end
      i += 1
      # p "current_pos" + current_pos.to_s
      # p @cups[current_pos]
      @cups[current_pos] << :stone
      ending_cup_idx  = current_pos
    end

    ending_cup_idx = (ending_cup_idx) % 14
    # p " hello"
    # p "e_index" + ending_cup_idx.to_s
    # p "e_index contents" + @cups[ending_cup_idx].to_s
    render
    next_turn(ending_cup_idx, current_player_name)



  end
  #
  #
  #


  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine what #make_move returns
    return :prompt if ending_cup_idx == @playercup[current_player_name]
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1_empty = (0..5).all? {|el| @cups[el].empty?}
    side2_empty = (7..12).all? {|el| @cups[el].empty?}
    return side1_empty || side2_empty
  end

  def winner

    name1_total = @cups[@playercup[@name1]].length
    name2_total = @cups[@playercup[@name2]].length
    if name1_total > name2_total
      return @name1
    elsif name2_total > name2_total
      return @name2
    else
      return :draw
    end

  end
end

# b = Board.new("Erica", "Ben")
# b.make_move(10, "Alex")
# p b.cups[10]
