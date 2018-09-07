class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.integer :value
      t.integer :row
      t.integer :column
      t.integer :block
      t.integer :puzzle_number
      t.boolean :complete_status
      t.timestamps null: false
    end
  end
end
