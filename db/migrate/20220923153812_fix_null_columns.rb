class FixNullColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :games, :year, :integer, null: false
    change_column :games, :leftover, :text, array: true, null: false
    change_column :games, :couples, :text, array: true, null: false
  end
end
