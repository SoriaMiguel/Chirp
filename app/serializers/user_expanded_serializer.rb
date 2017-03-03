class UserExpandedSerializer < ActiveModel::Serializer
  attributes :username, :name, :email, :api_token, :avatar
end
