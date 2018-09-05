class AddPossibleValue < ActiveRecord::Migration[5.2]
  def change
    add_column :cells, :possibles, :text, array: true, default: []
  end
end
