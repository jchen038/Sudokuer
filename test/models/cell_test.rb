require 'test_helper'

class CellTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :cells
  test "Cell: get_block" do
    cell = cells(:one)
    cell_two = cells(:two)
    assert Cell.get_block(cell.row, cell.column) == cell.block, "Cell: get_block did not return correct block value"
    assert Cell.get_block(cell_two.row, cell_two.column) == cell_two.block, "Cell Two did not return correct block value"
  end

  test "Cell: Save" do
    cell = Cell.new
    assert_not cell.save, "Save Cell with row, column, block, value"
  end
end
