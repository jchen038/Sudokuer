require 'test_helper'

class CellTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :cells
  test "get cell block" do
    cell = cells(:one)
    cell_two = cells(:two)
    assert Cell.get_block(cell.row, cell.column) == cell.block, "Cell: get_block did not return correct block value"
    assert Cell.get_block(cell_two.row, cell_two.column) == cell_two.block, "Cell Two did not return correct block value"
  end
end
