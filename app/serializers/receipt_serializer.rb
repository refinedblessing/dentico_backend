class ReceiptSerializer < ActiveModel::Serializer
  attributes :id, :payment_type, :cost
  has_one :appointment
end
