class FixNullColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :departments, :name, :string, null: false
    change_column :employees, :name, :string, null: false
    change_column :employees, :department_id, :integer, null: false
    change_column :games, :year, :integer, null: false
    change_column :games, :leftover, :text, null: false
    change_column :games, :couples, :text, null: false
  end
end
