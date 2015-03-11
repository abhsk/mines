require 'spec_helper'

describe Cell do

  context 'safe' do
    it 'should return false for cell with mine' do
      cell = Cell.new(0, 0, true)

      expect(cell.safe?).to be_falsey
    end

    it 'should return true for non mie cell' do
      cell = Cell.new(0, 0, false)

      expect(cell.safe?).to be_truthy
    end
  end

  context 'has coordinate' do

    it 'should return true if coordinates matches' do
      cell = Cell.new(0, 0, false)

      expect(cell.has_coordinates?(0, 0)).to be_truthy
    end

    it 'should return false if coordinates does not match' do
      cell = Cell.new(1, 0, false)

      expect(cell.has_coordinates?(0, 0)).to be_falsey
    end

  end

  context 'open' do
    it 'should return true if already opened' do
      cell = Cell.new(1, 1, false)

      cell.open

      expect(cell.opened).to be_truthy
    end

    it 'should return false if not opened' do
      cell = Cell.new(1, 1, false)

      expect(cell.opened).to be_falsey
    end


    it 'should mark cell as opened and return true if safe' do
      cell = Cell.new(1, 1, false)

      expect(cell.open).to be_truthy
    end

    it 'should mark cell as opened and return false if not safe' do
      cell = Cell.new(1, 1, true)

      expect(cell.open).to be_falsey
    end

    it 'should return true if cell safe and opened' do
      cell = Cell.new(1, 1, false)
      cell.open

      expect(cell.safe_and_opened?).to be_truthy
      expect(cell.mine_and_flagged?).to be_falsey
    end

    it 'should return false if cell not safe and opened' do
      cell = Cell.new(1, 1, true)
      cell.open

      expect(cell.safe_and_opened?).to be_falsey
      expect(cell.mine_and_flagged?).to be_falsey
    end
  end

  context 'flag' do

    it 'should return false if cell safe but not opened' do
      cell = Cell.new(1, 1, false)

      expect(cell.safe_and_opened?).to be_falsey
      expect(cell.mine_and_flagged?).to be_falsey
    end

    it 'should return true if cell not safe and flagged' do
      cell = Cell.new(1, 1, true)
      cell.flag

      expect(cell.mine_and_flagged?).to be_truthy
      expect(cell.safe_and_opened?).to be_falsey
    end

    it 'should return false if cell not safe but not flagged' do
      cell = Cell.new(1, 1, true)

      expect(cell.safe_and_opened?).to be_falsey
      expect(cell.safe_and_opened?).to be_falsey
    end

    it 'should return false if cell safe but flagged' do
      cell = Cell.new(1, 1, false)

      expect(cell.safe_and_opened?).to be_falsey
      expect(cell.safe_and_opened?).to be_falsey
    end

  end

  context 'display' do
    it 'return - if not opened' do
      cell = Cell.new(1, 1, false)
      expect(cell.display).to eq('-')
    end

    it 'return 0 if  opened and safe' do
      cell = Cell.new(1, 1, false)
      cell.open

      expect(cell.display).to eq('0')
    end
    it 'return M if  opened and not safe' do
      cell = Cell.new(1, 1, true)
      cell.open

      expect(cell.display).to eq('M')
    end

    it 'return F if flagged' do
      cell = Cell.new(1, 1, false)
      cell.flag

      expect(cell.display).to eq('F')
    end
  end


end