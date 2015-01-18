class User < ActiveRecord::Base

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :twitter]
  
  mount_uploader :avatar, AvatarUploader


  has_many :subscribed_events
  has_many :events, through: :subscribed_events
  has_many :created_events, foreign_key: "creator_id", class: Event

  def self.from_omniauth(auth)
  	#binding.pry
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.firstname = auth.info.first_name
        user.lastname = auth.info.last_name
        user.gender = auth.extra.raw_info.gender
        user.image_url = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
  end

  def fullname
  	"#{firstname} #{lastname}" if firstname
  end

  def create_event(params)
    #binding.pry
    new_event = self.created_events.new(params)
    #new_event.participants.append(self)
    new_event
  end
end
