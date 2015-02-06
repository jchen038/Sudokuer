class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def create
  end

  def new
    new_puzzle = Puzzle.create(name: "New Puzzle")
    new_puzzle.add_first
    redirect_to root_path
  end

  def solve
    puzzle = Puzzle.find(params[:id])
    puzzle.solve
    redirect_to puzzle_path(id: params[:id])
  end

  def destroy
    Puzzle.find(params[:id]).destroy
    redirect_to root_path
  end
end
