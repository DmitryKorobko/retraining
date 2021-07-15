# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
