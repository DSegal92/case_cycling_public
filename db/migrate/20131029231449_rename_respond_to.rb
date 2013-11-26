class RenameRespondTo < ActiveRecord::Migration
  def change
  	rename_column :messages, :respond_to, :respond_to_email
  end

end
