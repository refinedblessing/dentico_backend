class User < ApplicationRecord
  has_many :appointments, inverse_of: :user
  has_many :completed_appts, -> { completed }, class_name: "Appointment"
  has_many :cancelled_appts, -> { cancelled }, class_name: "Appointment"
  has_many :booked_appts, -> { booked }, class_name: "Appointment"

  has_many :receipts, through: :appointments
  has_many :cash_receipts, -> { cash_payment_type }, through: :appointments, source: :receipt
  has_many :debit_receipts, -> { debit_payment_type }, through: :appointments, source: :receipt
  has_many :credit_receipts, -> { credit_payment_type }, through: :appointments, source: :receipt

  enum user_type: [:patient, :staff, :admin]
  enum sex: [:male, :female]

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.total_revenue
    # orderby sum of receipt cost
  end
end
