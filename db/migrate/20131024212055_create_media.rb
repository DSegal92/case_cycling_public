class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :url
      t.boolean :is_photo
      t.boolean :is_video

      t.timestamps
    end
  end
end
