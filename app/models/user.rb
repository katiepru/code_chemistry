class User < ActiveRecord::Base
  attr_accessible :auth_token, :email, :username
  validates :username, :email, :presence => true
end
