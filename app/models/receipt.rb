class Receipt < ApplicationRecord
  belongs_to :appointment
  validates_associated :appointment
  enum payment_type: [:cash, :debit, :credit], _suffix: true
end
