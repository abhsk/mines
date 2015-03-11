require 'spec_helper'

describe InputParser do

  it 'should parse the input' do
    input = 'o(0,1)'

    expect(InputParser.parse(input)).to eq(['open', 0,1])
  end

  it 'should parse the input' do
    input = 'f(1,1)'

    expect(InputParser.parse(input)).to eq(['flag', 1,1])
  end
end