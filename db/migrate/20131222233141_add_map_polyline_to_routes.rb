class AddMapPolylineToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :map_polyline, :string
  end
end
