require_relative 'grid.rb'
require_relative 'input_parser.rb'

class Minesweeper

  def initialize(input)
    @grid = Grid.for(input)
  end

  def play
    p @grid
    while !game_over?
      print "Enter your option : "
      input = gets.chomp
      process(input)
      p @grid
    end
    p "You won" and return if won?
    p "You lost"
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