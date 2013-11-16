class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :picture_url
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
