class ReceiptSerializer < ActiveModel::Serializer
  attributes :id, :type, :cost
  has_one :user
end
