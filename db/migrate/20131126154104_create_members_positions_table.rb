class CreateMembersPositionsTable < ActiveRecord::Migration
  def self.up
  	create_table :members_positions, :id => false do |t|
  		t.references :member
  		t.references :position
  end
  add_index :members_positions, [:member_id, :position_id]
  add_index :members_positions, :position_id
end

  def self.down
  	drop_table :members_positions
  end
end
