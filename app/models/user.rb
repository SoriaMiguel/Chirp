class User < ApplicationRecord
  has_many :posts

  has_secure_token :api_token
  has_secure_password
  acts_as_followable
  acts_as_follower


end
