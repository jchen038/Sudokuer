class AddBaseCell < ActiveRecord::Migration
  def change
    add_column :cells, :base_cell, :boolean
  end
end
