module Puzzles
  class BuildCoordinator
    attr_reader :puzzle

    def initialize(puzzle:)
      @puzzle = puzzle
    end

    def call
      build
    end

    private

    def cells
      @cells ||= puzzle.cells
    end

    def find_cells(row, column)
      cells.where(row: row, column: column).last
    end

    def build
      (1..9).each do |row|
        (1..9).each do |column|
          cell = find_cells(row, column)
          next if cell.present? && cell.value.present?
          poss = (1..9).to_a
          b_at = Cell.get_block(row, column)
          horrizon = build_horrizontal(row)
          vertical = build_vertical(column)
          block = build_block(b_at)
          exists = (horrizon + vertical + block).uniq

          puzzle.cells.create!(
            row: row,
            column: column,
            possibles: (poss - exists).sort,
            block: b_at
          )
        end
      end
    end

    def build_horrizontal(row)
      cells.where(row: row).map{|cell| cell.value}
    end

    def build_vertical(column)
      cells.where(column: column).map{|cell| cell.value}
    end

    def build_block(block)
      cells.where(block: block).map{|cell| cell.value}
    end
  end
end
