class ChangePossibleToIntArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :cells, :possibles
    add_column :cells, :possibles, :int, array: true, default: []
  end
end
