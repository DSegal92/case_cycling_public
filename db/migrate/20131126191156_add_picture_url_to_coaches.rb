class AddPictureUrlToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :picture_url, :string
  end
end
