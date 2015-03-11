class Cell

  attr_reader :opened, :flagged

  def initialize(x, y, mine)
    @x = x
    @y = y
    @mine = mine
    @opened = false
    @flagged = false
  end

  def safe?
    !@mine
  end

  def has_coordinates?(x, y)
    @x == x && @y == y
  end

  def display
    if opened
      return safe? ? '0' : 'M'
    else
      return flagged ? 'F' : '-'
    end
  end

  def flag
    @flagged = true
  end

  def open
    @opened = true
    safe?
  end

  def safe_and_opened?
    safe? && opened
  end

  def mine_and_flagged?
    flagged && @mine
  end
end