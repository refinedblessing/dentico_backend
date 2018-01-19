class Receipt < ApplicationRecord
  belongs_to :appointment
  validates_associated :appointment
  enum payment_type: [:cash, :debit, :credit], _suffix: true
  default_scope -> { order(created_at: :desc) }
end
