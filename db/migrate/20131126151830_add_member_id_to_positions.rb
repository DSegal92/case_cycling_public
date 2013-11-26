class AddMemberIdToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :member_id, :integer
  end
end
