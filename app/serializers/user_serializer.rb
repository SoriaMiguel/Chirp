class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :api_token, :password_digest
end
