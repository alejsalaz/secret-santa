class FixNotNullColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :games, :leftover, :text, null: true
    change_column :games, :couples, :text, null: true
  end
end
