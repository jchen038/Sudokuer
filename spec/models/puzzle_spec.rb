require "rails_helper"

RSpec.describe Puzzle, type: :model do
  context 'with cells' do
    let(:puzzle) { FactoryBot.create(:puzzle, :complete) }

    it 'expect to have same cells with demo' do
      expect(puzzle.cells.count).to eq(36)
    end
  end
end