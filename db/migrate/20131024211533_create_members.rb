class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :standing
      t.string :picture_url
      t.boolean :is_officer
      t.boolean :is_admin

      t.timestamps
    end
  end
end
