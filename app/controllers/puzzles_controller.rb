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
    Puzzle.create(name: "New Puzzle")
    redirect_to root_path
  end
end
