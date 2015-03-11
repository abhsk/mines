require_relative 'cell.rb'

class Grid


  class << self
    def for(input)
      cells, size_x, size_y = cells_for(input)
      Grid.new(cells, size_x, size_y)
    end

    private

    def cells_for(input)
      rows = input.split(',')
      cells = rows.map.with_index(0) do |row, row_position|
        row.chars.map.with_index do |value, col_position|
          Cell.new(row_position, col_position, value == 'm')
        end
      end.flatten
      [cells, rows.size, rows.first.size]
    end
  end

  def game_over?
    @cells.any? { |cell| !cell.safe? && cell.opened } || won?
  end

  def flag(x, y)
    cell_with(x, y).flag
  end

  def won?
    @cells.all? { |cell| cell.safe_and_opened? || cell.mine_and_flagged? }
  end

  def open(x, y)
    cell_with(x, y).open
  end

  def display
    @size_x.times do |x|
      @size_y.times do |y|
        cell = cell_with(x, y)
        print cell.display
      end
      puts ""
    end
  end

  private

  def initialize(cells,size_x, size_y)
    @cells = cells
    @size_x = size_x
    @size_y = size_y
  end

  def cell_with(x, y)
    @cells.select { |cell| cell.has_coordinates?(x, y) }.first
  end
end