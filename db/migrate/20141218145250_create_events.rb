class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :appointment
      t.string :location
      t.boolean :private
      t.text :description

      t.timestamps
    end
  end
end
