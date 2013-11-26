class AddRankingToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :ranking, :integer
  end
end
