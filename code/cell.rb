class Cell

  attr_reader :x, :y, :mine, :opened

  def initialize(x,y,mine)
    @x = x
    @y = y
    @mine = mine
    @opened = false
    @flagged = false
  end

  def safe?
    !@mine
  end

  def has_coordinates?(x,y)
    @x == x && @y == y
  end

  def flag
    @flagged = true
  end

  def open
    @opened = true
    safe?
  end

  def safe_and_opened?
    safe? && opened?
  end

  def mine_and_flagged?
    flagged? && @mine
  end

  def opened?
    @opened
  end

  def flagged?
    @flagged
  end
end