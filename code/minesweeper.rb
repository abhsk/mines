require_relative 'grid.rb'
require_relative 'input_parser.rb'

class Minesweeper

  def initialize(input)
    @grid = Grid.for(input)
  end

  def play
    display
    while !game_over?
      print "Enter your option : "
      input = gets.chomp
      process(input)
      display
    end
    p "You won" and return if won?
    p "You lost"
  end

  def display
    grid_view = @grid.display
    grid_view.each do |row|
      puts row
    end
  end

  def process(input)
    action, x, y = InputParser.parse(input)
    @grid.send(action,x,y)
  end

  def game_over?
    @grid.game_over?
  end

  def won?
    @grid.won?
  end

end