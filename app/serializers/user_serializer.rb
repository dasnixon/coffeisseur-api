class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :roaster, :about,
    :username, :password_digest
end
