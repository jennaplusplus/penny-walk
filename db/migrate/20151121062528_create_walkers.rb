class CreateWalkers < ActiveRecord::Migration
  def change
    create_table :walkers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
