class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.time :time
      t.string :location

      t.timestamps
    end
  end
end
