class AddColumnPasswordSaltToMembers < ActiveRecord::Migration
  def change
    add_column :members, :password_salt, :string
  end
end
