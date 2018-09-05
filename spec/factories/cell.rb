FactoryBot.define do
  factory :cell do
    puzzle
    value { 1 }
    row { 1 }
    column { 1 }
    block { 1 }
    possibles { [] }
    base_cell { true }
  end
end
