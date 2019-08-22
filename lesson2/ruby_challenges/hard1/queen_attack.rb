class Queens
  attr_reader :white, :black, :white_x, :white_y, :black_x, :black_y

  def initialize(white: [0, 3], black: [7, 3])
    @white = white
    @black = black
    raise ArgumentError if @white == @black
    @white_x = @white[0]
    @white_y = @white[1]
    @black_x = @black[0]
    @black_y = @black[1]
  end

  def to_s
    board = ["________\n", "________\n", "________\n", "________\n", "________\n", "________\n", "________\n", "________"]
    board[white_x][white_y] = 'W '
    board[black_x][black_y] = 'B '
    board = board.join('').gsub(/_/, "_ ").gsub(/_ \n/, "_\n").delete_suffix(' ')
  end

  def attack?
    begin
      slope = (black_y - white_y)/(black_x - white_x)
    rescue ZeroDivisionError
      slope = 0
    end
    return true if (slope == 0 || slope == 1 || slope == -1)
    false
  end
end

