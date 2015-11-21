class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start_latitude
      t.string :start_longitude
      t.string :end_latitude
      t.string :end_longitude
      t.integer :walker_id

      t.timestamps null: false
    end
  end
end
