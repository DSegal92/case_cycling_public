class AddMemberIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :member_id, :integer
  end
end
