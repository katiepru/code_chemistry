class User < ActiveRecord::Base
  # Main identifiers
  attr_accessible :auth_token, :email, :username, :gravatar

  # Coding style attributes
  attr_accessible :indent

  validates :username, :email, :presence => true

  has_and_belongs_to_many :project
end
