class SubscribedEvent < ActiveRecord::Base
  belongs_to :events
  belongs_to :users
  
  def participate?
    participate  
  end
end
