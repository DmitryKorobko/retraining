# frozen_string_literal: true

class LoanDecorator < Draper::Decorator
  delegate_all

  def formatted_date(date='borrowing')
    if date == 'borrowing'
      object.created_at.strftime("%m/%d/%Y") unless object.created_at.nil?
    else
      object.period.strftime("%m/%d/%Y") unless object.period.nil?
    end
  end
end
