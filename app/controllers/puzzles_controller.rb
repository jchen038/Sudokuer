class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def build
    puzzle = Puzzle.find(permitted_params)
    Puzzles::BuildCoordinator.new(puzzle: puzzle).call
    redirect_back(fallback_location: root_path)
  end

  def solve
    puzzle = Puzzle.find(permitted_params)
    Puzzles::SolveCoordinator.new(puzzle: puzzle).call
    redirect_back(fallback_location: root_path)
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def create
    puzzle = Puzzle.create(name: params[:name])
    (1..9).each do |row|
      (1..9).each do |column|
        if !params["#{row}-#{column}"].empty?
          puzzle.cells.create(row: row, column: column, value: params["#{row}-#{column}"].to_i, block: Cell.get_block(row, column), base_cell: true)
        end
      end
    end
    if puzzle
      redirect_to action: "index"
    else
      render action: "new"
    end
  end

  def new
    @puzzle = Puzzle.new
  end

  def destroy
    puzzle = Puzzle.find(params[:id])
    puzzle.cells.all.destroy_all
    puzzle.destroy
    redirect_to root_path
  end

  private

  def permitted_params
    params.required(:id)
  end
end
