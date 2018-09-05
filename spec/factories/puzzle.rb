FactoryBot.define do
  factory :puzzle do

    trait :complete do
      name { 'base' }

      after(:create) do |puzzle|
        create :cell, puzzle: puzzle, value: 1, row: 2, column: 1, block: 1
        create :cell, puzzle: puzzle, value: 7, row: 2, column: 2, block: 1
        create :cell, puzzle: puzzle, value: 2, row: 1, column: 3, block: 1
        create :cell, puzzle: puzzle, value: 6, row: 3, column: 3, block: 1
        create :cell, puzzle: puzzle, value: 2, row: 2, column: 4, block: 2

        create :cell, puzzle: puzzle, value: 9, row: 2, column: 5, block: 2
        create :cell, puzzle: puzzle, value: 3, row: 3, column: 5, block: 2
        create :cell, puzzle: puzzle, value: 1, row: 1, column: 7, block: 3
        create :cell, puzzle: puzzle, value: 4, row: 1, column: 8, block: 3
        create :cell, puzzle: puzzle, value: 8, row: 3, column: 7, block: 3

        create :cell, puzzle: puzzle, value: 7, row: 3, column: 9, block: 3
        create :cell, puzzle: puzzle, value: 3, row: 4, column: 1, block: 4
        create :cell, puzzle: puzzle, value: 2, row: 4, column: 2, block: 4
        create :cell, puzzle: puzzle, value: 9, row: 5, column: 3, block: 4
        create :cell, puzzle: puzzle, value: 1, row: 4, column: 4, block: 5

        create :cell, puzzle: puzzle, value: 8, row: 4, column: 5, block: 5
        create :cell, puzzle: puzzle, value: 7, row: 4, column: 6, block: 5
        create :cell, puzzle: puzzle, value: 3, row: 5, column: 4, block: 5
        create :cell, puzzle: puzzle, value: 5, row: 5, column: 6, block: 5
        create :cell, puzzle: puzzle, value: 4, row: 6, column: 4, block: 5

        create :cell, puzzle: puzzle, value: 2, row: 6, column: 5, block: 5
        create :cell, puzzle: puzzle, value: 9, row: 6, column: 6, block: 5
        create :cell, puzzle: puzzle, value: 2, row: 5, column: 7, block: 6
        create :cell, puzzle: puzzle, value: 8, row: 6, column: 8, block: 6
        create :cell, puzzle: puzzle, value: 5, row: 6, column: 9, block: 6

        create :cell, puzzle: puzzle, value: 7, row: 7, column: 1, block: 7
        create :cell, puzzle: puzzle, value: 3, row: 7, column: 3, block: 7
        create :cell, puzzle: puzzle, value: 6, row: 9, column: 2, block: 7
        create :cell, puzzle: puzzle, value: 4, row: 9, column: 3, block: 7
        create :cell, puzzle: puzzle, value: 5, row: 7, column: 5, block: 8

        create :cell, puzzle: puzzle, value: 4, row: 8, column: 5, block: 8
        create :cell, puzzle: puzzle, value: 8, row: 8, column: 6, block: 8
        create :cell, puzzle: puzzle, value: 4, row: 7, column: 7, block: 9
        create :cell, puzzle: puzzle, value: 3, row: 8, column: 8, block: 9
        create :cell, puzzle: puzzle, value: 6, row: 8, column: 9, block: 9

        create :cell, puzzle: puzzle, value: 7, row: 9, column: 7, block: 9
      end
    end
  end
end