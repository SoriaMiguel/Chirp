class PostSerializer < ActiveModel::Serializer

  belongs_to :usergit 
  attributes :body

end
