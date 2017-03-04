class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :avatar, :api_token, :id
end
