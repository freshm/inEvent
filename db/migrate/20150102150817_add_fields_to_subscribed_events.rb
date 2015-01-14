class AddFieldsToSubscribedEvents < ActiveRecord::Migration
  def change
    add_column :subscribed_events, :user_id, :integer
    add_column :subscribed_events, :events_id, :integer
  end
end
