class CreateSponsorshipOffers < ActiveRecord::Migration
  def change
    create_table :sponsorship_offers do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
