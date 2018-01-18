class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_type, :name, :email, :phone, :sex, :age
end
