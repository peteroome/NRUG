class Message < ActiveRecord::Base
  # Filters
  #
  after_create :send_message_to_twitter
  
  # Relationships
  #
  belongs_to :user
  
  # Validation
  #
  validates_presence_of :user_id, :body
  
  # Twitter Messaging
  #
  require "twitter"
  
  def send_message_to_twitter
    users = User.to_contact_via_twitter.twitter_usernames
    users.each do |user|
      begin
        dm = Twitter.direct_message_create(user.username, self.body[0,140])
        dm.inspect.to_s
      rescue Twitter::Error::Unauthorized, Twitter::Error::Forbidden
        Twitter::Error::Unauthorized.inspect.to_s
        Twitter::Error::Forbidden.inspect.to_s
      end
    end
  end
  
  def to_param
    "#{id}-#{created_at.to_s.parameterize}"
  end
end