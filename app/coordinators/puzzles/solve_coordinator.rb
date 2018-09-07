module Puzzles
  class SolveCoordinator
    attr_reader :puzzle

    def initialize(puzzle:)
      @puzzle = puzzle
    end

    def call
      clean_up
      rebuild
    end

    private

    def rebuild
      ::Puzzles::BuildCoordinator.new(puzzle: puzzle.reload).call
    end

    def clean_up
      cells = puzzle.cells.select{|cell| cell.possibles.count == 1}
      cells.each do |cell|
        cell.update!(value: cell.possibles.last)
      end
    end
  end
end
