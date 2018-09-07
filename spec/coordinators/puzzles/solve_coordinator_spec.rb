require "rails_helper"

RSpec.describe Puzzles::SolveCoordinator do
  describe '#call' do
    let(:puzzle) { FactoryBot.create(:puzzle, :complete) }
    let(:coordinator) do
      described_class.new(puzzle: puzzle)
    end

    context '' do
      before do
        Puzzles::BuildCoordinator.new(puzzle: puzzle).call
        puzzle.reload
      end

      it '' do
        expect(puzzle.cells.select{|cell| cell.value.present?}.count).to eq(36)
        coordinator.call
        puzzle.reload
        expect(puzzle.cells.select{|cell| cell.value.present?}.count).to eq(45)
      end
    end
  end
end