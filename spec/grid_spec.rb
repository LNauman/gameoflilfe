require 'spec_helper'

describe Grid do
  let(:target_cell) { Cell.new }
  let(:neighbors) { [] }
  let(:grid) { Grid.new }

  def populate_neighbors_with_this_many_alive_cells(num)
    (8-num).times { neighbors.push(Cell.new) }
    num.times { cell = Cell.new; cell.resurrect!; neighbors.push(cell) }
  end

  it 'brings a cell to life with exactly 3 alive neighbors' do
    populate_neighbors_with_this_many_alive_cells(3)
    grid.destine_cell(target_cell, neighbors)
    expect(target_cell).to be_alive
  end

  it 'kills a cell which has more than 3 alive neighbors' do
    target_cell.resurrect!
    populate_neighbors_with_this_many_alive_cells(5)

    grid.destine_cell(target_cell, neighbors)

    expect(target_cell).to_not be_alive
  end

  it 'kills cell if it has less than 2 alive neighbors' do
    target_cell.resurrect!
    populate_neighbors_with_this_many_alive_cells(1)

    grid.destine_cell(target_cell, neighbors)

    expect(target_cell).to_not be_alive
  end

  it 'keeps a cell alive if it has exactly 2 alive neighbors' do
    target_cell.resurrect!
    populate_neighbors_with_this_many_alive_cells(2)

    grid.destine_cell(target_cell, neighbors)

    expect(target_cell).to be_alive
  end

  it 'keeps a cell alive if it has exactly 3 alive neighbors' do
    target_cell.resurrect!
    populate_neighbors_with_this_many_alive_cells(3)

    grid.destine_cell(target_cell, neighbors)

    expect(target_cell).to be_alive
  end
end