class Receipt < ApplicationRecord
  belongs_to :user
  enum type: [:cash, :debit, :credit]
end
