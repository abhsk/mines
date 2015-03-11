require 'spec_helper'

describe Grid do
  it 'should return false when cell with mine is opened' do
    input = 'mx,xx'

    grid = Grid.for(input)

    expect(grid.open(0,0)).to be_falsey
  end

  it 'should return false when cell with mine is opened' do
    input = 'xx,xx'

    grid = Grid.for(input)

    expect(grid.open(0,0)).to be_truthy
  end

  it 'should return false when cell with mine is opened' do
    input = 'xx,xx'

    grid = Grid.for(input)

    expect(grid.open(0,0)).to be_truthy
  end

  it 'should return  true when any cell with mine is opened' do
    input = 'mx,xx'

    grid = Grid.for(input)

    grid.open(0,0)

    expect(grid.game_over?).to be_truthy
  end

  it 'should return false when no cell with mine is opened' do
    input = 'mx,xx'

    grid = Grid.for(input)

    grid.open(1,1)

    expect(grid.game_over?).to be_falsey
  end

  it 'should return true when all cell with mine is flagged and others are opened' do
    input = 'mx,xx'

    grid = Grid.for(input)

    grid.open(0,1)
    grid.open(1,1)
    grid.open(1,0)
    grid.flag(0,0)

    expect(grid.won?).to be_truthy
  end

  it 'should return false when any cell with mine is not flagged or safe cell are  not opened' do
    input = 'mx,xx'

    grid = Grid.for(input)

    grid.open(0,1)
    grid.open(1,1)
    grid.flag(1,0)
    grid.flag(0,0)

    expect(grid.won?).to be_falsey
  end

end