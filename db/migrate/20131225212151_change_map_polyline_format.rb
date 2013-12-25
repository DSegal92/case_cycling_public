class ChangeMapPolylineFormat < ActiveRecord::Migration
  def self.up
  	change_column :routes, :map_polyline, :text
  end

  def down
  	change_column :routes, :map_polyline, :string
  end
end
