class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :respond_to
      t.text :contents

      t.timestamps
    end
  end
end
