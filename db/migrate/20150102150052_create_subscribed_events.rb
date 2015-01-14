class CreateSubscribedEvents < ActiveRecord::Migration
  def change
    create_table :subscribed_events do |t|
      t.boolean :participate

      t.timestamps
    end
  end
end
