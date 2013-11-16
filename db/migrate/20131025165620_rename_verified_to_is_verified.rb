class RenameVerifiedToIsVerified < ActiveRecord::Migration
  def change
  	rename_column :members, :verified, :is_verified
  end

end
