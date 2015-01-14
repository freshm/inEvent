class AddBoolsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname_private, :boolean, default: false
    add_column :users, :lastname_private, :boolean, default: false
    add_column :users, :gender_private, :boolean, default: false
    add_column :users, :birthday_private, :boolean, default: false
    add_column :users, :city_private, :boolean, default: false
    add_column :users, :zipcode_private, :boolean, default: false
    add_column :users, :interests_private, :boolean, default: false
  end
end
