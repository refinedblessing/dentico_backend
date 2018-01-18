class Appointment < ApplicationRecord
  belongs_to :user
  enum status: [:booked, :cancelled, :completed]
end
