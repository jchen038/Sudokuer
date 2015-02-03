class Puzzle < ActiveRecord::Base
  has_many :cells

  def add_first
    self.cells.create(value: 8, row: 1, column: 2, block: 1, base_cell: true)
    self.cells.create(value: 4, row: 1, column: 4, block: 2, base_cell: true)
    self.cells.create(value: 9, row: 1, column: 6, block: 2, base_cell: true)
    self.cells.create(value: 6, row: 1, column: 7, block: 3, base_cell: true)
    self.cells.create(value: 5, row: 1, column: 8, block: 3, base_cell: true)
    self.cells.create(value: 3, row: 1, column: 9, block: 3, base_cell: true)
    self.cells.create(value: 6, row: 2, column: 1, block: 1, base_cell: true)
    self.cells.create(value: 4, row: 2, column: 2, block: 1, base_cell: true)
    self.cells.create(value: 2, row: 2, column: 3, block: 1, base_cell: true)
    self.cells.create(value: 8, row: 2, column: 4, block: 2, base_cell: true)
    self.cells.create(value: 7, row: 2, column: 8, block: 3, base_cell: true)
    self.cells.create(value: 8, row: 3, column: 7, block: 3, base_cell: true)
    self.cells.create(value: 7, row: 4, column: 3, block: 4, base_cell: true)
    self.cells.create(value: 5, row: 4, column: 6, block: 5, base_cell: true)
    self.cells.create(value: 4, row: 4, column: 8, block: 6, base_cell: true)
    self.cells.create(value: 2, row: 4, column: 9, block: 6, base_cell: true)
    self.cells.create(value: 7, row: 5, column: 4, block: 5, base_cell: true)
    self.cells.create(value: 1, row: 5, column: 6, block: 5, base_cell: true)
    self.cells.create(value: 8, row: 6, column: 1, block: 4, base_cell: true)
    self.cells.create(value: 5, row: 6, column: 2, block: 4, base_cell: true)
    self.cells.create(value: 6, row: 6, column: 4, block: 5, base_cell: true)
    self.cells.create(value: 1, row: 6, column: 7, block: 6, base_cell: true)
    self.cells.create(value: 6, row: 7, column: 3, block: 7, base_cell: true)
    self.cells.create(value: 1, row: 8, column: 2, block: 7, base_cell: true)
    self.cells.create(value: 4, row: 8, column: 6, block: 8, base_cell: true)
    self.cells.create(value: 7, row: 8, column: 7, block: 9, base_cell: true)
    self.cells.create(value: 3, row: 8, column: 8, block: 9, base_cell: true)
    self.cells.create(value: 6, row: 8, column: 9, block: 9, base_cell: true)
    self.cells.create(value: 2, row: 9, column: 1, block: 7, base_cell: true)
    self.cells.create(value: 7, row: 9, column: 2, block: 7, base_cell: true)
    self.cells.create(value: 3, row: 9, column: 3, block: 7, base_cell: true)
    self.cells.create(value: 5, row: 9, column: 4, block: 8, base_cell: true)
    self.cells.create(value: 8, row: 9, column: 6, block: 8, base_cell: true)
    self.cells.create(value: 1, row: 9, column: 8, block: 9, base_cell: true)
  end

  def solve
    puzzle = [ {block: 1, row: [1,2,3], column: [1,2,3]},  # 1
               {block: 2, row: [1,2,3], column: [4,5,6]},  # 2
               {block: 3, row: [1,2,3], column: [7,8,9]},  # 3
               {block: 4, row: [4,5,6], column: [1,2,3]},  # 4
               {block: 5, row: [4,5,6], column: [4,5,6]},  # 5
               {block: 6, row: [4,5,6], column: [7,8,9]},  # 6
               {block: 7, row: [7,8,9], column: [1,2,3]},  # 7
               {block: 8, row: [7,8,9], column: [4,5,6]},  # 8
               {block: 9, row: [7,8,9], column: [7,8,9]}]  # 9
    while self.cells.count < 81
      puzzle.each do |p|
        (1..9).each do |value| # values in block
          rows = (self.cells.where(block: p[:block], value: value, row: p[:row]).map{|r| r.row} + p[:row]).uniq
          columns = (self.cells.where(block: p[:block], value: value, column p[:column]).map{|r| r.column} + p[:column]).uniq
          if rows.count == 1 && columns.count == 1 
            self.cells.create(block: p[:block], value: value, column: columns.first, row:rows.first)
          end 
        end
      end
    end

  end
end
