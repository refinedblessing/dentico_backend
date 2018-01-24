class Receipt < ApplicationRecord
  belongs_to :appointment
  validates_associated :appointment
  enum payment_type: [:cash, :debit, :credit], _suffix: true
  default_scope -> { order(created_at: :desc) }
  validate :appointment_is_completed

  scope :between, -> (start_datetime, end_datetime) {
    where("updated_at between ? and ?", start_datetime, end_datetime)
  }

  private

  def appointment_is_completed
    appointment = Appointment.find(self.appointment_id)
    errors.add(:appointment, "needs to be booked.") if appointment.status != "completed"
  end
end
