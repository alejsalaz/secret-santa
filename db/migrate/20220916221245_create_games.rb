class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :year
      t.text :leftover, array: true
      t.text :couples, array: true

      t.timestamps
    end
  end
end
