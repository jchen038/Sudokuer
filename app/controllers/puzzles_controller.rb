class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def create
    puzzle = Puzzle.create(name: params[:name])
    (1..9).each do |row|
      (1..9).each do |column|
        if params["#{row}-#{column}"].to_i != 0
          puzzle.cells.create(row: row, column: column, value: params["#{row}-#{column}"].to_i, base_cell: true)
        end
      end
    end
    redirect_to puzzle_path(id: puzzle.id)
  end

  def new
    @puzzle = Puzzle.new
  end

  def solve
    puzzle = Puzzle.find(params[:id])
    puzzle.solve
    redirect_to puzzle_path(id: params[:id])
  end

  def destroy
    puzzle = Puzzle.find(params[:id])
    puzzle.cells.all.destroy_all
    puzzle.destroy
    redirect_to root_path
  end

  def save
    puzzle = Puzzle.find(params[:id])
    (1..9).each do |row|
      (1..9).each do |column|
        if params["#{row}-#{column}"].to_i == 0
          cell = puzzle.cells.where(row: row, column: column)
          if !cell.first.nil?
            cell.destroy_all if !cell.first.base_cell
          end
        else
          cell = puzzle.cells.where(row: row, column: column)
          if cell.empty?
            puzzle.cells.create(row: row, column: column, value: params["#{row}-#{column}"].to_i)
          else
            if !cell.first.base_cell
              cell.first.update(value: params["#{row}-#{column}"].to_i)
            end
          end
        end
      end
    end
    redirect_to puzzle_path(id: params[:id])
  end
end
