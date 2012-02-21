class User < ActiveRecord::Base
  # Relationships
  #
  has_many :sent_messages, :class_name => "Message", :foreign_key => "user_id"
  
  # Named Scopes
  #
  scope :to_contact_via_twitter,
        :conditions => ["substring(medium, 1, 1) = ?", '@']
  
  scope :twitter_usernames,
        :select => "substring(medium, 2) AS username"
  
  # Instance variables
  #
  def to_s
    name
  end

  # Class variables
  #
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["first_name"]
      user.email = auth["info"]["email"]
      user.website = auth["info"]["urls"]["Website"]
      user.twitter = auth["info"]["urls"]["Twitter"]
      user.facebook = auth["info"]["urls"]["Facebook"]
    end
  end
end