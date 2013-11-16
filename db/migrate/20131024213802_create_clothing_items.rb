class CreateClothingItems < ActiveRecord::Migration
  def change
    create_table :clothing_items do |t|
      t.string :name
      t.string :picture_url

      t.timestamps
    end
  end
end
