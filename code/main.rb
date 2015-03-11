require_relative 'minesweeper.rb'

print "Enter the mine layout : "
input = gets.chomp
minesweeper = Minesweeper.new(input)

minesweeper.play