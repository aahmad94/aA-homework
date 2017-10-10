class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      unless idx == 6 || idx == 13
        4.times do
          cups[idx] << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos > 12 || start_pos == 6 || start_pos <= 0
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    # empties cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    # distributes stones
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      piles = (0...6).to_a + (7...13).to_a
      if piles.include?(cup_idx)
        @cups[cup_idx] << stones.pop
      elsif cup_idx == 6 && current_player_name == @name1
        @cups[cup_idx] << stones.pop
      elsif cup_idx == 13 && current_player_name == @name2
        @cups[cup_idx] << stones.pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      # ended on store -- start again
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      # ended on empty cup -- switches players' turns
      :switch
    else
      # ended on cup with stones in it -- start from there
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0...6].all? { |cup| cup.empty? } || cups[0...13].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if cups[6] == cups[13]
    if cups[6].length > cups[13].length
      @name1
    elsif cups[6].length > cups[13].length
      @name2
    end
  end
end
