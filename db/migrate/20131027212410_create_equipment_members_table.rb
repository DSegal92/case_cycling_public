class CreateEquipmentMembersTable < ActiveRecord::Migration
  def self.up
  	create_table :equipment_members, :id => false do |t|
  		t.references :equipment
  		t.references :member
  end
  add_index :equipment_members, [:equipment_id, :member_id]
  add_index :equipment_members, :member_id
end

  def self.down
  	drop_table :equipment_members
  end
end
