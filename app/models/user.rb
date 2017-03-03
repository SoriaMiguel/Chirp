class User < ApplicationRecord
  has_many :posts

  has_secure_token :api_token
  has_secure_password
  acts_as_followable
  acts_as_follower
  validates :name, presence: true
  validates :username, presence: true

end
