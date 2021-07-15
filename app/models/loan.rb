# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def expired?
    Time.now.utc.beginning_of_day > period
  end

  def expired_days
    ((Time.now.utc.beginning_of_day - period.beginning_of_day) / 1.day).to_i
  end
end
