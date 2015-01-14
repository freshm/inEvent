class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :uid
      t.string :provider

      t.timestamps
    end
  end
end
