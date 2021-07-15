# frozen_string_literal: true

class AuthorDecorator < Draper::Decorator
  delegate_all

  def formatted_date(date='birth')
    if date == 'birth'
      object.date_of_birth.strftime("%m/%d/%Y") unless object.date_of_birth.nil?
    else
      object.date_of_death.strftime("%m/%d/%Y") unless object.date_of_death.nil?
    end
  end
end
