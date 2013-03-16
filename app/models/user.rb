class User < ActiveRecord::Base
  attr_accessible :auth_token, :email, :username
  has_one :authorizations
  validates :username, :email, :presence => true
end
