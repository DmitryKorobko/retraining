# frozen_string_literal: true

class LoanDecorator < Draper::Decorator
  delegate_all

  def formatted_period
    object.period.strftime("%m/%d/%Y") unless object.period.nil?
  end
end
