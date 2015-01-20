class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|

      t.timestamps null: false
    end
    add_column :cells, :puzzle_id, :integer
    remove_column :cells, :puzzle_number, :integer
  end
end
