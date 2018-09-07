module PuzzlesHelper
  def find_cell_in_puzzle(puzzle:, row:, column:)
    puzzle.cells.where(row: row, column: column).last
  end
end
