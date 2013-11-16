class AddEquipmentIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :equipment_id, :integer
  end
end
