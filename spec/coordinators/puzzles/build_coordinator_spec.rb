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

        expect(puzzle.cells.map{|cell| cell.possibles.count}.inject(&:+)).to eq(95)
      end
    end
  end
end