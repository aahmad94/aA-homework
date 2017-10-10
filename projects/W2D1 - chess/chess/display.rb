require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display
  attr_reader :cursor, :board
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board=board
  end

  def colorsquare(row, col)
    if (row%2==0)
      if (col%2==0)
        print (board.grid[row][col] ? " #{board.grid[row][col]}|"  : "   ").colorize(:background => :white)
      else
        print (board.grid[row][col] ? " #{board.grid[row][col]}|"  : "   ").colorize(:background => :blue)
      end
    else
      if (col%2==0)
        print (board.grid[row][col] ? " #{board.grid[row][col]}|"  : "   ").colorize(:background => :blue)
      else
        print (board.grid[row][col] ? " #{board.grid[row][col]}|"  : "   ").colorize(:background => :white)
      end
    end
  end

  def render

    8.times do |row|
      (0..7).each do |col|
        if ([row,col]==cursor.cursor_pos)
          print (board.grid[row][col] ? " #{board.grid[row][col]}|"  : "   ").colorize(:background => :red)
        else
          colorsquare(row, col)
        end
      end
      puts
    end


    nil
  end

  def play
    turn = 1
    while turn <= 10
      system("clear")
      render
      cursor.get_input
      turn += 1
    end
  end

end

display = Display.new(Board.new)
# p display
p display.play
# p String.colors                       # return array of all possible colors names
# p String.modes
