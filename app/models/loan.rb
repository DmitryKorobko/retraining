class Loan < ApplicationRecord
  has_one :user
  has_one :book
end
