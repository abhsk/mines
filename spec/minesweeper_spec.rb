require 'spec_helper'

describe Minesweeper do

  it 'should return true if we select cell with mine ' do
    mine_layout = 'mm,xx'
    minesweeper = Minesweeper.new(mine_layout)

    input = 'o(0,0)'

    minesweeper.process(input)

    expect(minesweeper.game_over?).to be_truthy
  end

  it 'should return false if we select cell with mine' do
    mine_layout = 'mm,xx'
    minesweeper = Minesweeper.new(mine_layout)

    input = 'o(1,1)'

    minesweeper.process(input)

    expect(minesweeper.game_over?).to be_falsey
  end

  it 'should return true if game is won' do
    mine_layout = 'mm,xx'
    minesweeper = Minesweeper.new(mine_layout)

    minesweeper.process('o(1,0)')
    minesweeper.process('o(1,1)')
    minesweeper.process('f(0,0)')
    minesweeper.process('f(0,1)')

    expect(minesweeper.won?).to be_truthy
  end

  it 'should return the something' do
    mine_layout = 'mm,xx'
    minesweeper = Minesweeper.new(mine_layout)

    expect { minesweeper.display }.to output("--\n--\n").to_stdout
  end

  it 'should return the something' do
    mine_layout = 'mm,xx'
    minesweeper = Minesweeper.new(mine_layout)

    minesweeper.process('o(1,1)')
    minesweeper.process('o(1,0)')
    minesweeper.process('f(0,0)')

    expect { minesweeper.display }.to output("F-\n22\n").to_stdout
  end

end