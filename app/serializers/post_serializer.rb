class PostSerializer < ActiveModel::Serializer

  belongs_to :user
  attributes :body

end
