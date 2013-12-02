class ChangeRouteInformationFormat < ActiveRecord::Migration
 def self.up
   change_column :routes, :distance, :string
    change_column :routes, :elevation, :string
  end

  def self.down
   change_column :routes, :distance, :integer
    change_column :routes, :elevation, :string
  end
end