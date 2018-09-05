require "rails_helper"

RSpec.describe Puzzles::BuildCoordinator do
  describe '#call' do
    let(:puzzle) { FactoryBot.create(:puzzle, :complete) }
    let(:coordinator) do
      described_class.new(
        puzzle: puzzle
      )
    end

    context '' do
      it '' do
        coordinator.call
        puzzle.reload
        expect().to
      end
    end
  end
end
