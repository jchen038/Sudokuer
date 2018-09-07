class AddPuzzleName < ActiveRecord::Migration[5.2]
  def change
    add_column :puzzles, :name, :string
  end
end
