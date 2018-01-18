class User < ApplicationRecord
  has_many :appointments, inverse_of: :user

  enum user_type: [:patient, :staff, :admin]
  enum sex: [:male, :female]

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
