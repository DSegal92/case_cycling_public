class AddTierToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :tier, :integer
  end
end
