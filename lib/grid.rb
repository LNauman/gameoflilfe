class Grid
  def destine_cell(target_cell, neighbors)
    alive_neighbors = neighbors.select { |cell| cell.alive? }
    if target_cell.alive?
      if alive_neighbors.count > 3 || alive_neighbors.count < 2
        target_cell.kill!
      end
    elsif !target_cell.alive? && alive_neighbors.count == 3
      target_cell.resurrect!
    end
  end
end