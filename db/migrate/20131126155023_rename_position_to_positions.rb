class RenamePositionToPositions < ActiveRecord::Migration
  def change
  	rename_column :members, :position_id, :position_ids
  end
end
