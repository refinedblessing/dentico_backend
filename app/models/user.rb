class User < ApplicationRecord
  has_many :appointments
  has_many :receipts

  enum type: [:patient, :staff, :admin]
  enum sex: [:male, :female]
end
