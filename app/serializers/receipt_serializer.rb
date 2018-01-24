class ReceiptSerializer < ActiveModel::Serializer
  attributes :id, :payment_type, :cost
end
