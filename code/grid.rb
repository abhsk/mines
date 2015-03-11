require_relative 'cell.rb'

class Grid

  attr_reader :cells

  class << self
    def for(input)
      Grid.new(cells_for(input))
    end

    def cells_for(input)
      rows = input.split(',')
      rows.map.with_index(0) do |row, row_position|
        row.chars.map.with_index do |value, col_position|
          Cell.new(row_position, col_position, value == 'm')
        end
      end.flatten
    end
  end

  def game_over?
    @cells.any? {|cell| !cell.safe? && cell.opened?} || won?
  end

  def flag(x,y)
    cell_with(x,y).flag
  end

  def won?
    cells.all? {|cell| cell.safe_and_opened? || cell.mine_and_flagged?}
  end

  def open(x,y)
    cell_with(x,y).open
  end

  def inspect
    @cells.each do |cell|
       p cell.opened? ? (cell.safe? ? '0' : 'M') : (cell.flagged? ? 'F' : '-')
    end
  end

  private

  def initialize(cells)
    @cells = cells
  end

  def cell_with(x,y)
    @cells.select{ |cell| cell.has_coordinates?(x,y) }.first
  end
end