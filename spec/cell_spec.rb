require 'spec_helper'

describe Cell do
  it 'should be dead on arrival' do
    cell = Cell.new
    expect(cell.alive?).to eq false
  end

  it 'should be alive when resurrected' do
    cell = Cell.new
    cell.resurrect!
    expect(cell.alive?).to eq true
  end
end