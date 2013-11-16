class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :distance
      t.integer :elevation
      t.string :url
      t.text :description
      t.boolean :verified

      t.timestamps
    end
  end
end
