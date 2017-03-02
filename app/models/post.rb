class Post < ApplicationRecord
  belongs_to :user

  validates :body, :user_id, presence: true #between 1-160
  validates :body, length: {in: 1..160}

end
