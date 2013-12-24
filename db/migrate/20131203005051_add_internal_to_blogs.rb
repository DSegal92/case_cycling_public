class AddInternalToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :internal, :boolean
  end
end
