class AddColumnEmailToMember < ActiveRecord::Migration
  def change
    add_column :members, :email, :string
  end
end
