class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      #right is true, left is false
      t.boolean :left_right
      t.integer :blocks
      t.integer :trip_id
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
