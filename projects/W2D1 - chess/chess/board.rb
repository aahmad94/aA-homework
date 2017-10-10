require_relative "piece.rb"
class Board
 attr_reader :grid

  def initialize
    @grid=Array.new(8) {Array.new(8)}

    @grid.length.times do |col|
      self[[0,col]]=Piece.new
      self[[7,col]]=Piece.new
    end


  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end



  def move_piece(start_pos, end_pos)
    raise "there is no piece at start_pos" if self[start_pos]==nil
    raise "the piece cannot move to end_pos." if (false)

    self[end_pos]=self[start_pos]
    self[start_pos]=nil
  end
end

    # a=Board.new
    # p a.grid
    #
    # a.move_piece([0,0],[3,0])
    # p a.grid
