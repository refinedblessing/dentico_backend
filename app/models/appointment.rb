class Appointment < ApplicationRecord
  belongs_to :user
  validates_associated :user
  has_one :receipt, inverse_of: :appointment
  enum status: [:booked, :cancelled, :completed]
  default_scope -> { order(created_at: :desc) }
end
