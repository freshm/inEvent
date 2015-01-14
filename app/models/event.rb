class Event < ActiveRecord::Base
  belongs_to :creator, class: User
  has_many :subscribed_events, foreign_key: "events_id"
  has_many :users, through: :subscribed_events
  
  mount_uploader :picture, PictureUploader

  validates_presence_of :title
  validates_presence_of :appointment
  validates_presence_of :location
end
