require "rails_helper"

RSpec.describe Puzzles::BuildCoordinator do
  describe '#call' do
    let(:puzzle) { FactoryBot.create(:puzzle, :complete) }
    let(:coordinator) do
      described_class.new(puzzle: puzzle)
    end

    context 'with full puzzle' do
      it 'returns puzzle with updated cells and all possibility' do
        coordinator.call
        puzzle.reload

        expect(puzzle.cells.map{|cell| cell.possibles.count}.inject(&:+)).to eq(107)
      end

      it 'returns cell count' do
        coordinator.call
        puzzle.reload

        expect(puzzle.cells.count).to eq(81)
      end

      it 'returns correct possible for center piece' do
        coordinator.call
        puzzle.reload

        expect(puzzle.cells.where(row: 5, column: 5).last.possibles).to match(["6"])
      end
    end
  end
end
