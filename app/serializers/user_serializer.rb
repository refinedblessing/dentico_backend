class UserSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :email, :phone, :sex, :city_code, :age
end
