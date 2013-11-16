class AddColumnPasswordHashToMembers < ActiveRecord::Migration
  def change
    add_column :members, :password_hash, :string
  end
end
