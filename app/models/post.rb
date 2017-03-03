class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true #between 1-160
  validates :body, length: {in: 1..160}
  # validates :name, presence: true

  def self.timeline(user)
    following_ids = user.followees.pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end
end


# ["wezoiV62AsBtt4VhguZgMMWg",
#  "hHwkNYpXY2fykFQxE9HZAu9B",
#  "bzxdaHbP3SM55TTXJoCmUggw",
#  "KkMBZcMnTihqUt1c7aAHzVee",
#  "D11c1BYcXPpmmH4pmPawebo4",
#  "73iXww6TXK8xydRk7G15UmqM"]
