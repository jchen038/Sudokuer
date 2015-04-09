require 'test_helper'

class PuzzleTest < ActiveSupport::TestCase
  fixtures :puzzles

  test "Puzzle: Save" do
    puzzle = Puzzle.new
    assert_not puzzle.save
    assert_equal
  end
end
