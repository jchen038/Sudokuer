class AddBaseCell < ActiveRecord::Migration[5.2]
  def change
    add_column :cells, :base_cell, :boolean
  end
end
