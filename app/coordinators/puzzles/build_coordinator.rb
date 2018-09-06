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
      (1..9).to_a.each do |row|
        (1..2).to_a.each do |column|
          cell = find_cells(row, column)
          next if cell.present? && cell.value.present?
          horr_pos = build_horrizontal(row, column)
          vert_pos = build_vertical(row, column)
          bloc_pos = build_block(row, column)
          possibles = [
            horr_pos,
            vert_pos,
            bloc_pos
          ].flatten.uniq.compact

          puzzle.cells.create!(
            row: row,
            column: column,
            possibles: possibles,
            block: Cell.get_block(row,column)
          )
        end
      end
    end

    def build_horrizontal(row, column)
      exits = []
      (1..9).to_a.each do |c|
        next if column == c
        cell = find_cells(row, c)
        next if cell.nil?
        exits << cell.value
      end
      (1..9).to_a - exits.uniq.compact
    end

    def build_vertical(row, column)
      exits = []
      (1..9).to_a.each do |r|
        next if row == r
        cell = find_cells(r, column)
        next if cell.nil?
        exits << cell.value
      end
      (1..9).to_a - exits.uniq.compact
    end

    def build_block(row, column)
      cell = find_cells(row, column)
      return [] if cell.blank?
      (1..9).to_a - cells.where(block: cell.block).map{|cell| cell.value}
    end
  end
end
