class User < ActiveRecord::Base
  # Main identifiers
  attr_accessible :auth_token, :email, :username

  # Coding style attributes
  attr_accessible :tabs, :spaces
  validates :username, :email, :presence => true
end
