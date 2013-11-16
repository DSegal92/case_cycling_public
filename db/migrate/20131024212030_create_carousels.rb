class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :picture_url

      t.timestamps
    end
  end
end
