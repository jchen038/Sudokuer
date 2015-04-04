class Cell < ActiveRecord::Base
  validates :value, :row, :column, :block, presence: true
  belongs_to :puzzle

  def self.get_block(row, column)
    block = 0
    if [4,5,6].include?(row)
      block += 3
    elsif [7,8,9].include?(row)
      block += 6
    end

    if [1,2,3].include?(column)
      block += 1
    elsif [4,5,6].include?(column)
      block += 2
    elsif [7,8,9].include?(column)
      block += 3
    end
    block
  end
end
